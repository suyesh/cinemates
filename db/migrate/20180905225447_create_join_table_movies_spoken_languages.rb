class CreateJoinTableMoviesSpokenLanguages < ActiveRecord::Migration[5.2]
  def change
    create_join_table :movies, :spoken_languages do |t|
      t.index [:movie_id, :spoken_language_id], name: 'movies_spoken_languages_index'
      t.index [:spoken_language_id, :movie_id], name: 'spoken_languages_movies_index'
    end
  end
end
