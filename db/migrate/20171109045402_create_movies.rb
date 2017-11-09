class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.integer :vote_count
      t.integer :tmdb_id, index: true
      t.boolean :video
      t.integer :vote_average
      t.string :title, index: true
      t.integer :popularity, index: true
      t.string :poster_path
      t.integer :original_language
      t.integer :original_title, index: true
      t.text :genre_ids, array: true, default: []
      t.integer :backdrop_path
      t.boolean :adult, index: true
      t.text :overview
      t.string :release_date, index: true

      t.timestamps
    end
  end
end
