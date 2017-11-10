require File.dirname(__FILE__) + '/../../config/environment.rb'
require 'date'
require 'zlib'
require 'open-uri'

MOVIE_BASE_URL = "http://files.tmdb.org/p/exports/movie_ids_#{Date.today.strftime("%m_%d_%Y")}.json.gz"
SOURCE = open(MOVIE_BASE_URL)
MOVIES = Zlib::GzipReader.new(SOURCE)

EXISTING_MOVIES = Movie.tmdb_ids

MOVIES.read.each_line do |movie|
  movie_id = JSON.parse(movie)["id"]
  if EXISTING_MOVIES.include?(movie_id)
    puts "Movie  with id #{movie_id} already in database."
    next
  end
  sleep 0.5
  movie = Tmdb::Movie.detail(movie_id)
  genres = movie.genres.map {|genre| genre.name}
  production_companies = movie.production_companies.map {|company| company.name}
  production_countries = movie.production_countries.map {|country| country.name}
  spoken_languages = movie.spoken_languages.map {|language| language.name}
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
    puts "Added #{movie.title}"
end
