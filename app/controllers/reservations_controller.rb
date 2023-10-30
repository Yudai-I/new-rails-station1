class ReservationsController < ApplicationController
  def new
    session[:previous_url] = request.referer
    @reservation = Reservation.new
    @movie = Movie.find(params[:movie_id])
    @schedule = Schedule.find(params[:schedule_id])
    @sheet = params[:sheet_id]
    @date = params[:date]

    if @sheet.blank? or @date.blank?
      redirect_to movie_path(@movie.id)
    end
    
  end

  def create
    schedule = Schedule.find(params[:schedule_id])
    sheet = params[:sheet_id]
    reservation = Reservation.new(reservation_params)
    reservation.schedule_id = schedule.id
    reservation.sheet_id = sheet
    reservation.date = params[:date]

    if reservation.save
      redirect_to movie_path(params[:movie_id])
    else
      flash.now[:error] = 'その座席はすでに予約済みです'
      redirect_to session[:previous_url]
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:date, :name, :email, :schedule_id, :sheet_id)
  end
end
