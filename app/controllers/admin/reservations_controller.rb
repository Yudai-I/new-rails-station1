class Admin::ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
    @movies = Movie.all
    @schedules = Schedule.includes(:movie).all
    @sheets = Sheet.all
  end

  def create
    @reservation = Reservation.new(reservation_params)

    begin
      if @reservation.save
        flash[:notice] = '予約の作成に成功しました'
        redirect_to admin_reservations_path
      else
        Rails.logger.info(@reservation.errors.full_messages) # この行を修正しました
        flash.now[:error] = @reservation.errors.full_messages.to_sentence
        @movies = Movie.all
        @schedules = Schedule.includes(:movie).all
        @sheets = Sheet.all
        render :new, status: :bad_request
      end
    rescue ActiveRecord::RecordNotUnique
      flash.now[:error] = 'その座席はすでに予約済みです'
      @reservation = Reservation.new
      @movies = Movie.all
      @schedules = Schedule.all
      @sheets = Sheet.all
      render :new
    end
  end

  def update
    reservation = Reservation.find(params[:id])
    begin
      if reservation.update(reservation_params)
        redirect_to admin_reservations_path
        flash[:notice] = '予約の更新に成功しました'
      else
        flash.now[:error] = 'その座席はすでに予約済みです'
        @reservation = Reservation.find(params[:id])
        render :show
      end
    rescue ActiveRecord::RecordNotUnique
      flash.now[:error] = 'その座席はすでに予約済みです'
      @reservation = Reservation.find(params[:id])
      render :show
    end
  end

  def destroy
    reservation = Reservation.find(params[:id])
    if reservation.destroy
      flash[:notice] = "予約情報の削除に成功しました"
      redirect_to admin_reservations_path
    else
      flash.now[:error] = "予約情報の削除に失敗しました"
      render :show
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:date, :name, :email, :schedule_id, :sheet_id)
  end
end