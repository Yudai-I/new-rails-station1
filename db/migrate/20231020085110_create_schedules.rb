class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.integer :movie_id
      t.date :schedule_date, null: false
      t.time :start_time, null: false
      t.time :end_time, null: false
      t.timestamps
    end
    add_reference :schedules, :screen, null: false, foreign_key: true
  end
end
