namespace :ranking do
    desc 'Insert reservations into Ranking table for making ranked list'
    task insert_data: :environment do
        # rankingテーブルのdate_rankedカラムとして保存する用
        today = Date.today.strftime('%Y-%m-%d')
        last_thirty_day = Date.today - 30
        # 今日の日付から30日前までの予約を全取得
        reservations = Reservation.joins(:schedule).where("schedules.schedule_date >= ?", last_thirty_day)
        movie_reservations = Movie.joins(schedule: :reservations)
                                  .select("movies.name AS movie_name, COUNT(reservations.id) AS count_reservations")
                                  .group("movies.name")

        
end
