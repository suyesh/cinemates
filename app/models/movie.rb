class Movie < ApplicationRecord
  has_many :movies_lists
  
  def self.tmdb_ids
    Movie.all.map(&:tmdb_id)
  end
end
