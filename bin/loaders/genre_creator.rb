require File.dirname(__FILE__) + '/../../config/environment.rb'
require 'colorize'

EXISTING_GENRE = Genre.pluck(:name)
MOVIES_WITH_GENRES = Movie.pluck(:genres, :id)

Movie.pluck(:genres).flatten.compact.uniq.each do |genre|
  unless EXISTING_GENRE.include?(genre)
    puts "Creating #{genre}"
    Genre.create!(name: genre)
  end
end

MOVIES_WITH_GENRES.each do |movie|
  genres = movie[0]
  id = movie[1]
  unless genres.length < 1
    genres.each do |genre|
      g = Genre.find_by(name: genre)
      m = Movie.find_by(id: id)
      g.movies << m unless g.movies.pluck(:id).include?(m.id)
      puts "Added #{m.title} to #{g.name}"
    end
  end
end
