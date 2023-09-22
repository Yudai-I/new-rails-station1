class MoviesController < ApplicationController
  def index
    keyword = params[:name]
    if params[:is_showing] == nil
      @movies = Movie.all
    elsif params[:is_showing] == "2"
      @movies = Movie.where('name LIKE ?', "%#{keyword}%").or(Movie.where('description LIKE ?', "%#{keyword}%"))
    else
      @movies = Movie.where('name LIKE ?', "%#{keyword}%").or(Movie.where('description LIKE ?', "%#{keyword}%")).where(is_showing: params[:is_showing])
    end
    
    @movie = Movie.new
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
    redirect_to '/movies'
  end

  private
  
  def movie_params
    params.require(:movie).permit(:name, :year, :description, :image_url, :is_showing)
  end
end
