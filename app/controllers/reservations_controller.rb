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
    reservation = Reservation.new(reservation_params)

    begin
      if reservation.save
        redirect_to movie_path(reservation.schedule.movie.id)
      else
        flash.now[:error] = 'その座席の予約に問題があります'
        redirect_to movie_reservation_path(reservation.schedule.movie.id, date: reservation.date,
                                                                          schedule_id: reservation.schedule_id)
      end
    rescue ActiveRecord::RecordNotUnique
      flash[:error] = 'その座席はすでに予約済みです'
      redirect_to movie_reservation_path(reservation.schedule.movie.id, date: reservation.date,
                                                                        schedule_id: reservation.schedule_id)
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date, :name, :email, :schedule_id, :sheet_id)
  end
end
