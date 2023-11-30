class HomesController < ApplicationController
  def top
    @today = Date.today.strftime('%Y-%m-%d')
    last_thirty_date = Date.today - 30
    @rankings = Ranking.where("date_ranked >= ?", last_thirty_date)
  end
end
