class AddIndexToMovies < ActiveRecord::Migration[5.1]
  def change
    add_index :movies, :adult
  end
end
