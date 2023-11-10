# CreateSchedulesクラスは`schedules`テーブルを作成するためのマイグレーションを定義します。
# このテーブルは映画のスケジュール情報を格納することを目的としています。
#
# == カラム詳細:
# - movie_id: integer, 映画を参照する外部キーです。
# - schedule_date: date, 上映日を格納します。NULLを許可しません。
# - start_time: time, 上映開始時刻を格納します。NULLを許可しません。
# - end_time: time, 上映終了時刻を格納します。NULLを許可しません。
# - timestamps: レコードの作成日時と更新日時を自動記録するためのカラムです。
# さらに、`screen`を外部キーとして`schedules`テーブルに追加し、スクリーン情報に紐づけます。NULLは許可されず、外部キー制約が適用されます。
#
class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.integer :movie_id                    # 映画の外部キーID
      t.date :schedule_date, null: false     # 上映日
      t.time :start_time, null: false        # 上映開始時刻
      t.time :end_time, null: false          # 上映終了時刻
      t.timestamps # 作成・更新日時
    end
    # `screen`を外部キーとして追加
    add_reference :schedules, :screen, null: false, foreign_key: true
    add_reference :schedules, :theater, null: false, foreign_key: true
  end
end
