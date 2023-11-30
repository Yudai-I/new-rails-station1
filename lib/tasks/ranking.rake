namespace :ranking do
    desc 'Insert reservations into Ranking table for making ranked list'
    task insert_datas: :environment do
        # rankingテーブルのdate_rankedカラムとして保存する用
        today = Date.today.strftime('%Y-%m-%d')
        last_thirty_day = Date.today - 30
        # 今日から30日前までの予約情報をからmovieのidと映画ごとの予約件数の２つを取得
        movie_reservations = Reservation.joins(schedule: :movie)
                                        .where("schedules.schedule_date >= ?", last_thirty_day)
                                        .group('movies.id')
                                        .count
        # movie_reservationsにハッシュ形式でmovieのidと予約件数が格納されている
        movie_reservations.each do |movie_id, count|
            Ranking.create!(
                movie_id: movie_id,
                count_reservations: count,
                date_ranked: today
            )
        end
    end
end
