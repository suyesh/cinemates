class CreateMovieVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_videos do |t|
      t.string :iso_639_1
      t.string :iso_3166_1
      t.string :key
      t.string :name
      t.string :site
      t.integer :size
      t.string :video_type
      t.references :movie, foreign_key: true
      t.string :tmdb_id

      t.timestamps
    end
    add_index :movie_videos, :iso_639_1
    add_index :movie_videos, :iso_3166_1
    add_index :movie_videos, :key
    add_index :movie_videos, :site
    add_index :movie_videos, :video_type
    add_index :movie_videos, :tmdb_id
  end
end
