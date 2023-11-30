class CreateRankings < ActiveRecord::Migration[6.1]
  def change
    create_table :rankings do |t|
      t.integer :movie_id, null: false
      t.integer :count_reservations, null: false
      t.date :date_ranked, null: false
      t.timestamps
    end
    add_index :rankings, [:movie_id, :date_ranked], unique: true, name: 'index_rank_on_movie_date'
  end
end
