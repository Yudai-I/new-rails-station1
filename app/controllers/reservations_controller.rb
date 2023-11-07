# 顧客用の予約情報コントローラ
class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    @schedule = Schedule.find_by(id: params[:schedule_id])
    @sheet = params[:sheet_id]
    @date = params[:date]

    unless @schedule
      head :not_found # 404 Not Found を返す
      return
    end

    return if @sheet && @date

    redirect_to movie_path(@movie.id)
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      handle_successful_reservation
    else
      handle_failed_reservation
    end
  rescue ActiveRecord::RecordNotUnique
    handle_unique_violation
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date, :name, :email, :schedule_id, :sheet_id)
  end

  def handle_successful_reservation
    redirect_to movie_path(@reservation.schedule.movie.id), notice: '予約が正常に作成されました。'
  end

  def handle_failed_reservation
    flash.now[:error] = 'その座席の予約に問題があります'
    redirect_to new_reservation_path(movie_id: @reservation.schedule.movie.id,
                                     date: @reservation.date,
                                     schedule_id: @reservation.schedule_id)
  end

  def handle_unique_violation
    flash[:error] = 'その座席はすでに予約済みです'
    redirect_to new_reservation_path(movie_id: @reservation.schedule.movie.id,
                                     date: @reservation.date,
                                     schedule_id: @reservation.schedule_id)
  end
end
