class HomesController < ApplicationController
  def top
    @today = Date.today
    @rankings = Ranking.where(date_ranked: @today)
                       .order(count_reservations: :desc)
    @rankings_for_select = Ranking.all
    @rankings_for_compare = Ranking.where(date_ranked: params[:date_ranked])
                              .order(count_reservations: :desc)
                              .pluck(:movie_id)                
  end
end
