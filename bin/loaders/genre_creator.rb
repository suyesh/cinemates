require File.dirname(__FILE__) + '/../../config/environment.rb'
require 'colorize'

EXISTING_GENRE = Genre.pluck(:name)

Movie.pluck(:genres).flatten.compact.uniq.each do |genre|
  unless EXISTING_GENRE.include?(genre)
    puts "Creating #{genre}"
    Genre.create!(name: genre)
  end
end

Movie.all.each do |movie|
  unless movie.genres.length < 1
    movie.genres.each do |genre|
      g = Genre.find_by(name: genre)
      g << movie unless g.movies.include?(genre)
    end
  end
end
