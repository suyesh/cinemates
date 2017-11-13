require File.dirname(__FILE__) + '/../../config/environment.rb'
require 'date'
require 'zlib'
require 'open-uri'
require 'colorize'

puts "Retrieving Existing movie ids from the database.".colorize(:blue)
EXISTING_MOVIES = Movie.pluck(:tmdb_id)
puts "#{EXISTING_MOVIES.length} existing movie ids retrieved.".colorize(:light_blue)

DATE_TODAY = Date.today.strftime("%m_%d_%Y") #11_11_2017

puts "Downloading and Reading latest Movie list for #{DATE_TODAY}".colorize(:blue)
MOVIES = Zlib::GzipReader.new(
  open("http://files.tmdb.org/p/exports/movie_ids_#{DATE_TODAY}.json.gz")
).read


MOVIES.each_line do |movie|
  movie_id = JSON.parse(movie)['id']
  if EXISTING_MOVIES.include?(movie_id)
    puts "Movie  with id #{movie_id} already in database.".colorize(:yellow)
    next
  end
  sleep 0.2
  begin
  movie = Tmdb::Movie.detail(movie_id)
  genres = movie.genres.map(&:name)
  production_companies = movie.production_companies.map(&:name)
  production_countries = movie.production_countries.map(&:name)
  spoken_languages = movie.spoken_languages.map(&:name)
  Movie.create!(adult: movie.adult,
                backdrop_path: movie.backdrop_path,
                budget: movie.budget,
                homepage: movie.homepage,
                tmdb_id: movie.id,
                imdb_id: movie.imdb_id,
                original_language: movie.original_language,
                original_title: movie.original_title,
                overview: movie.overview,
                popularity: movie.popularity,
                poster_path: movie.poster_path,
                release_date: movie.release_date,
                revenue: movie.revenue,
                runtime: movie.runtime,
                status: movie.status,
                tagline: movie.tagline,
                title: movie.title,
                video: movie.video,
                vote_average: movie.vote_average,
                vote_count: movie.vote_count,
                genres: genres,
                production_companies: production_companies,
                production_countries: production_countries,
                spoken_languages: spoken_languages
              )
  rescue => error
    puts "#{error} could not be added :(".colorize(:red)
    next
  end
  puts "Added #{movie.title} #{movie.id}".colorize(:green)
end

EXISTING_MOVIES.each do |movie_id|
  begin
  videos = Tmdb::Movie.videos(movie_id)
  movie = Movie.find_by(id: movie_id)
  if videos.length > 0 && movie.youtube_key.length < 1
    movie.youtube_key = videos.map(&:key)
    movie.save
    puts "Youtube video for movie #{movie.title} saved".colorize(:green)
  else
    puts "Skipping #{movie.title}".colorize(:red)
  end
  rescue
    next
  end
  sleep 0.5
end
