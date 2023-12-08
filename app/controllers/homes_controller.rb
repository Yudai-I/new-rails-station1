class HomesController < ApplicationController
  def top
    @today = Date.today
    @rankings = Ranking.where(date_ranked: @today)
                       .order(count_reservations: :desc)
    #　任意の過去の日付を選んで、現在とのランキング変動を調べるための選択肢
    @rankings_for_select = Ranking.select(:date_ranked).distinct
    # 選択した過去の日付からランキングのデータを抽出
    @rankings_for_compare = Ranking.where(date_ranked: params[:date_ranked])
                              .order(count_reservations: :desc)
                              .pluck(:movie_id)                
  end
end
