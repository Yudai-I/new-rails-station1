# CreateReservationsクラスは、予約情報を管理するための`reservations`テーブルを作成します。
# このテーブルには、映画の上映スケジュールに対する顧客の予約詳細が含まれます。
#
# == カラム詳細:
# - date: date, 予約日を格納します。NULLを許可しません。
# - schedule_id: integer, 予約された上映スケジュールのIDを参照します。NULLを許可しません。
# - sheet_id: integer, 予約された座席のIDを参照します。NULLを許可しません。
# - email: string, 予約者のメールアドレスを格納します。NULLを許可しません。
# - name: string, 予約者の名前を格納します。NULLを許可しません。
# - timestamps: レコードの作成日時と更新日時を自動記録するためのカラムです。
#
# == インデックス:
# 予約日、スケジュールID、座席IDの組み合わせに一意性の制約を設けることで、
# 同じスケジュール・同じ座席に対する重複予約を防ぎます。
#
class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.integer :schedule_id, null: false
      t.integer :sheet_id, null: false
      t.string :email, null: false
      t.string :name, null: false
      t.timestamps
    end

    add_index :reservations, [:schedule_id, :sheet_id], unique: true, name: 'index_res_on_sched_sheet'
  end
end
