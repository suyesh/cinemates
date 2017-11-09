class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.boolean :adult
      t.string :backdrop_path
      t.integer :budget
      t.string :homepage
      t.integer :tmdb_id, index: true, unique: true
      t.string :imdb_id, index: true
      t.string :original_language, index: true
      t.string :original_title, index: true
      t.text :overview
      t.decimal :popularity
      t.string :poster_path
      t.string :release_date, index: true
      t.integer :revenue, index: true
      t.integer :runtime
      t.string :status, index: true
      t.string :tagline
      t.string :title, index: true
      t.boolean :video
      t.decimal :vote_average
      t.integer :vote_count
      t.text :genres, array: true, default: []
      t.text :production_companies, array: true, default: []
      t.text :production_countries, array: true, default: []
      t.text :spoken_languages, array: true, default: []

      t.timestamps
    end
  end
end
