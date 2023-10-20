class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.integer :movie_id
      t.time :start_time, null: false
      t.time :end_time, null: false
      t.timestamps
    end
  end
end
