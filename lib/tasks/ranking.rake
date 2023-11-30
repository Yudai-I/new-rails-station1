namespace :ranking do
    desc 'Insert reservations into Ranking table for making ranked list'
    task insert_data: :environment do
        # rankingテーブルのdate_rankedカラムとして保存する用
        today = Date.today.strftime('%Y-%m-%d')
        last_thirty_year = (Date.today - 30).strftime('%Y-%m-%d').split("-").first
        last_thirty_month = (Date.today - 30).strftime('%Y-%m-%d').split("-").second
        last_thirty_day = (Date.today - 30).strftime('%Y-%m-%d').split("-").third
        # 今日の日付から30日前までの予約を全取得
        reservations = Reservation.joins(:schedule).where("schedules.schedule_date >= ?", Date.new(last_thirty_year, last_thirty_month, last_thirty_day))

end
