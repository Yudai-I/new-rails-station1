# 顧客用の映画コントローラ
class MoviesController < ApplicationController
  def index
    @movie = Movie.new
    @genres = Genre.all
    @movies = filter_movies(params[:name], params[:is_showing], params[:genre])
  end

  def show
    @movie = Movie.find(params[:id])
    @theaters = Theater.all
    @schedules = filter_schedules(params[:id], params[:theater_id])
  end

  def reservation
    session[:previous_url] = request.referer
    @movie = Movie.find(params[:movie_id])
    @sheets = Sheet.all
    @schedule = params[:schedule_id]

    handle_empty_reservation(@movie.id, @schedule)
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
    redirect_to '/movies'
  end

  def start_time_and_end_time
    "#{start_time} - #{end_time}"
  end

  private

  def filter_movies(keyword, show, genre)
    range = case show
            when '1' then Movie.where(is_showing: true).where(genre: genre)
            when '0' then Movie.where(is_showing: false).where(genre: genre)
            else Movie.where(genre: genre)
            end

    return range if keyword.blank?

    range.where('name LIKE ? OR description LIKE ?', "%#{keyword}%", "%#{keyword}%")
  end

  def filter_schedules(movie_id, theater_id)
    range = Schedule.where(movie_id: movie_id)
    return range.where(theater_id: theater_id)
  end

  def handle_empty_reservation(movie_id, schedule)
    return if schedule.present?

    flash[:alert] = '日付とスケジュールを選択してください。'
    redirect_to movie_path(movie_id)
  end

  def movie_params
    params.require(:movie).permit(:name, :genre, :year, :description, :image_url, :is_showing)
  end
end