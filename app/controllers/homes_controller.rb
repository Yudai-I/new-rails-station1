class HomesController < ApplicationController
  def top
    @today = Date.today
    @rankings = Ranking.where(date_ranked: @today)
  end
end
