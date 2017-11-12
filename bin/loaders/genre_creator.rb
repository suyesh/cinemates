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
      Genre.find_by(name: genre) << movie
    end
  end
end
