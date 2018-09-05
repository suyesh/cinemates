class CreateJoinTableMoviesProductions < ActiveRecord::Migration[5.2]
  def change
    create_join_table :movies, :productions do |t|
      t.index [:movie_id, :production_id], name: 'movies_productions_index'
      t.index [:production_id, :movie_id], name: 'productions_movies_index'
    end
  end
end
