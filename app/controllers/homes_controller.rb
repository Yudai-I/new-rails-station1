class HomesController < ApplicationController
  def top
    @today = Date.today.strftime('%Y-%m-%d')
    last_thirty_day = Date.today - 30
    # 今日の日付から30日前までの予約を全取得
    @reservations = Reservation.joins(:schedule).where("schedules.schedule_date >= ?", last_thirty_day)
    @movie_reservations = Reservation.joins(schedule: :movie)
                                     .where("schedules.schedule_date >= ?", last_thirty_day)
                                     .group('movies.id')
                                     .count
  end
end
