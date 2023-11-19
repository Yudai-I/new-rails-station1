# 予約情報を管理するためのテーブル

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
