class AddYoutubeKeyToMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :youtube_key, :string
  end
end
