class AddYoutubeKeyMainFinal < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :youtube_key, :text, array: true, default: []
  end
end
