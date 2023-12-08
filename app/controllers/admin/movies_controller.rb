module Admin
  # 管理者用の映画コントローラー
  class MoviesController < ApplicationController
    def index
      @movies = Movie.all
      @schedules = Schedule.all
    end

    def show
      @movie = Movie.find(params[:id])
      @schedules = Schedule.where(movie_id: @movie.id)
    end

    def new
      @movie = Movie.new
    end

    def create
      @movie = Movie.new(movie_params)
      if @movie.save
        redirect_to admin_movies_path
      else
        flash.now[:error] = '映画の名前が重複しています'
        render :new
      end
    end

    def edit
      @movie = Movie.find(params[:id])
    end

    def update
      @movie = Movie.find(params[:id])
      if @movie.update(movie_params)
        redirect_to admin_movies_path
      else
        flash.now[:error] = '映画の名前が重複しています'
        render :edit
      end
    end

    def destroy
      movie = Movie.find(params[:id])
      if movie.destroy
        flash[:notice] = '削除に成功しました'
        redirect_to '/admin/movies'
      else
        flash[:notice] = '削除に失敗しました'
        @movies = Movie.all
        render :index
      end
    end

    private

    def movie_params
      params.require(:movie).permit(:name, :genre, :year, :description, :image_url, :is_showing)
    end
  end
end
