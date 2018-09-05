class CreateJoinTableMoviesSpokenCountries < ActiveRecord::Migration[5.2]
  def change
    create_join_table :movies, :countries do |t|
      t.index [:movie_id, :country_id], name: 'movies_countries_index'
      t.index [:country_id, :movie_id], name: 'countries_movies_index'
    end
  end
end
