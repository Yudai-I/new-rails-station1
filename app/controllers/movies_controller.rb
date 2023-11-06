class MoviesController < ApplicationController
  def index
    @movie = Movie.new
    keyword = params[:name]
    show = params[:is_showing]

    @movies = Movie.all if show == '' && keyword == ''

    # @rangeは全てか上映中か上映予定か絞ったMovie配列
    @range = if show == '1'
               Movie.where(is_showing: true)
             elsif show == '0'
               Movie.where(is_showing: false)
             else
               Movie.all
             end

    # @rangeをさらに絞り込む
    if keyword.blank?
      @movies = @range
    else
      @movies = @range.merge(Movie.where('name LIKE ?',
                                         "%#{keyword}%").or(Movie.where('description LIKE ?', "%#{keyword}%")))
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @schedules = @movie.schedules
    @reservations = Reservation.all
  end

  def reservation
    # year = params["date(1i)"]
    # month = params["date(2i)"]
    # day = params["date(3i)"]
    # @date = "#{year}-#{month}-#{day}"
    session[:previous_url] = request.referer
    @sheets = Sheet.all
    @movie = Movie.find(params[:movie_id])
    @date = params[:date]
    @schedule = params[:schedule_id]

    return unless @schedule.blank? or @date.blank?

    redirect_to movie_path(@movie.id)
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

  def movie_params
    params.require(:movie).permit(:name, :year, :description, :image_url, :is_showing)
  end
end
