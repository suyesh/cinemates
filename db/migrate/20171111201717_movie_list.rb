class MovieList < ActiveRecord::Migration[5.1]
  def change
    create_table :movies_lists, id: false do |t|
      t.belongs_to :movie, index: true
      t.belongs_to :list, index: true
    end
  end
end
