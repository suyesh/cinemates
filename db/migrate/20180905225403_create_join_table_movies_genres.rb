class CreateJoinTableMoviesGenres < ActiveRecord::Migration[5.2]
  def change
    create_join_table :movies, :genres do |t|
      t.index [:movie_id, :genre_id], name: 'movies_genres_index'
      t.index [:genre_id, :movie_id], name: 'genres_movies_index'
    end
  end
end
