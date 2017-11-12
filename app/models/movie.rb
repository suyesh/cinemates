class Movie < ApplicationRecord
  has_many :movies_lists
  has_and_belongs_to_many :genres

  def self.tmdb_ids
    Movie.pluck(:tmdb_id)
  end
end
