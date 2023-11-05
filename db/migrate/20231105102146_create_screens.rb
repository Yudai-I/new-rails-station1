class CreateScreens < ActiveRecord::Migration[6.1]
  def change
    create_table :screens do |t|
      t.integer :screen_number, null: false
      t.timestamps
    end
    add_index :screens, :screen_number, unique: true
  end
end
