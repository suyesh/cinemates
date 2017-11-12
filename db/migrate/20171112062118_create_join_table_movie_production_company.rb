class CreateJoinTableMovieProductionCompany < ActiveRecord::Migration[5.1]
  def change
    create_join_table :movies, :production_companies do |t|
      t.index [:movie_id, :production_company_id], name: :movie_production
      t.index [:production_company_id, :movie_id], name: :production_movie
    end
  end
end
