class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :date, null: false
      t.integer :schedule_id, null: false
      t.integer :sheet_id, null: false
      t.string :email, null: false
      t.string :name, null: false
      t.timestamps
    end

    add_index :reservations, [:date, :schedule_id, :sheet_id], unique: true
  end
end
