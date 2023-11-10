module Admin
  # 管理者用の映画の予約情報管理コントローラ
  class ReservationsController < ApplicationController
    before_action :set_reservation, only: %i[show update destroy]
    before_action :load_movies_and_schedules_and_sheets, only: %i[new create]

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
      @theaters = Theater.all
    end

    def create
      @reservation = Reservation.new(reservation_params)
      if save_reservation
        redirect_to admin_reservations_path, notice: '予約の作成に成功しました'
      else
        render :new, status: :bad_request
      end
    rescue ActiveRecord::RecordNotUnique
      handle_reservation_conflict
    end

    def update
      if update_reservation
        redirect_to admin_reservations_path, notice: '予約の更新に成功しました'
      else
        flash.now[:error] = '更新に失敗しました'
        render :show
      end
    rescue ActiveRecord::RecordNotUnique
      flash.now[:error] = 'その座席はすでに予約済みです'
      render :show
    end

    def destroy
      reservation = Reservation.find(params[:id])
      if reservation.destroy
        flash[:notice] = '予約情報の削除に成功しました'
        redirect_to admin_reservations_path
      else
        flash.now[:error] = '予約情報の削除に失敗しました'
        render :show
      end
    end

    private

    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # 共通のコードをロードするbefore_action
    def load_movies_and_schedules_and_sheets
      @movies = Movie.all
      @schedules = Schedule.includes(:movie).all
      @sheets = Sheet.all
    end

    # 予約の保存処理を抽出したメソッド
    def save_reservation
      if @reservation.save
        true
      else
        Rails.logger.info(@reservation.errors.full_messages)
        flash.now[:error] = @reservation.errors.full_messages.to_sentence
        false
      end
    end

    def update_reservation
      @reservation.assign_attributes(reservation_params)
      if @reservation.save
        true
      else
        Rails.logger.info(@reservation.errors.full_messages)
        flash.now[:error] = @reservation.errors.full_messages.to_sentence
        false
      end
    end

    # 座席衝突時のエラーハンドリングを抽出したメソッド
    def handle_reservation_conflict
      flash.now[:error] = 'その座席はすでに予約済みです'
      @reservation = Reservation.new(reservation_params)
      render :new
    end

    def reservation_params
      params.require(:reservation).permit(:date, :name, :email, :schedule_id, :sheet_id, :theater_id)
    end
  end
end
