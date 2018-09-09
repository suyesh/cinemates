class ChangeIntegerLimit < ActiveRecord::Migration[5.2]
  def change
    change_column :movies, :revenue, :integer, limit: 8
    change_column :movies, :vote_count, :integer, limit: 8
    change_column :movies, :runtime, :integer, limit: 8
    change_column :movies, :tmdb_id, :integer, limit: 8
  end
end
