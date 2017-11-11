class Movie < ApplicationRecord
  def self.tmdb_ids
    Movie.all.map(&:tmdb_id)
  end
end
