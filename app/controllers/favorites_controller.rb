class FavoritesController < ApplicationController
    def create
        movie = Movie.find(params[:movie_id])
        favorite = Favorite.new(movie_id: movie.id)
        favorite.user_id = current_user.id
        favorite.save
        redirect_to movies_path
    end

    def destroy
        movie = Movie.find(params[:movie_id])
        favorite = Favorite.find_by(movie_id: movie.id, user_id: current_user.id)
        favorite.destroy
        redirect_to movies_path
    end
end
