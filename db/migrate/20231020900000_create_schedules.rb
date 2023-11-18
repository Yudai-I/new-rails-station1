# 映画のスケジュール情報を格納。
class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.integer :movie_id                    # 映画の外部キーID
      t.date :schedule_date, null: false     # 上映日
      t.time :start_time, null: false        # 上映開始時刻
      t.time :end_time, null: false          # 上映終了時刻
      t.references :screen, null: false, foreign_key: true
      t.references :theater, null: false, foreign_key: true
      t.timestamps # 作成・更新日時
      t.index [:schedule_date, :start_time, :end_time, :screen_id, :theater_id], unique: true, name: 'index_schedules_on_unique_combination'
    end
  end
end
