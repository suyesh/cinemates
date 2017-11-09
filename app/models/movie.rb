class Movie < ApplicationRecord
  def self.tmdb_ids
    ids = []
    Movie.all.each do |movie|
      ids << movie.tmdb_id
    end
    ids
  end
end
