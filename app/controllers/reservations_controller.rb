class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    @movie = Movie.find(params[:movie_id])
    @schedule = Schedule.find(params[:schedule_id])
    @sheet = params[:sheet_id]
    @date = params[:date]

    unless @sheet && @date
      redirect_to movie_path(@movie.id)
    end
    
  end

  def create
    reservation = Reservation.new(reservation_params)

    begin
      if reservation.save
        redirect_to movie_path(reservation.movie_id)
      else
        flash.now[:error] = 'その座席の予約に問題があります'
        redirect_to request.referer
      end
    rescue ActiveRecord::RecordNotUnique
      flash[:error] = 'その座席はすでに予約済みです'
      redirect_to movie_reservation_path(reservation.movie_id, date: reservation.date, schedule_id: reservation.schedule_id)
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:movie_id, :date, :name, :email, :schedule_id, :sheet_id)
  end
end
