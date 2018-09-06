class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :name
      t.integer :tmdb_id

      t.timestamps
    end
    add_index :genres, :name
    add_index :genres, :tmdb_id
  end
end
