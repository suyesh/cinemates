require File.dirname(__FILE__) + '/../../config/environment.rb'
require 'date'
require 'zlib'
require 'open-uri'
require 'colorize'
TOTAL_PAGES_IN_CHANGES = Tmdb::Change.movie.total_pages

def populate_latest_changed_movies
  changed_movies = []
  counter = 1
  while counter <= TOTAL_PAGES_IN_CHANGES
    changed_movies << Tmdb::Change.movie(page: counter).results.pluck(:id)
    counter += 1
  end
  puts "Page #{counter} of #{TOTAL_PAGES_IN_CHANGES}".colorize(:yellow)
  return changed_movies.flatten
end

puts "Retrieving Existing movie ids from the database.".colorize(:blue)
EXISTING_MOVIES = Movie.pluck(:tmdb_id)
puts "#{EXISTING_MOVIES.length} existing movie ids retrieved.".colorize(:light_blue)

DATE_TODAY = Date.today.strftime("%m_%d_%Y")

puts "Getting changed movies".colorize(:green)
CHANGED_MOVIES_IDS = populate_latest_changed_movies

puts "Downloading and Reading latest Movie list for #{DATE_TODAY}".colorize(:blue)
MOVIES = Zlib::GzipReader.new(
  open("http://files.tmdb.org/p/exports/movie_ids_#{DATE_TODAY}.json.gz")
).read


def create_movie(movie)
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
              )
end

def update_movie(movie_id)
    movie = Movie.find_by(tmdb_id: movie_id)
    changed_movie = Tmdb::Movie.detail(movie_id)
    puts "Updating #{movie.title}".colorize(:blue)
    movie.adult = changed_movie.adult,
    movie.backdrop_path = changed_movie.backdrop_path,
    movie.budget = changed_movie.budget,
    movie.homepage = changed_movie.homepage,
    movie.tmdb_id = changed_movie.id,
    movie.imdb_id = changed_movie.imdb_id,
    movie.original_language = changed_movie.original_language,
    movie.original_title = changed_movie.original_title,
    movie.overview = changed_movie.overview,
    movie.popularity = changed_movie.popularity,
    movie.poster_path = changed_movie.poster_path,
    movie.release_date = changed_movie.release_date,
    movie.revenue = changed_movie.revenue,
    movie.runtime = changed_movie.runtime,
    movie.status = changed_movie.status,
    movie.tagline = changed_movie.tagline,
    movie.title = changed_movie.title,
    movie.video = changed_movie.video,
    movie.vote_average = changed_movie.vote_average,
    movie.vote_count = changed_movie.vote_count,
    movie.save
    add_relations(changed_movie, movie)
    puts "Updated #{movie.title}".colorize(:green)
end

def add_relations(movie, created_movie)
  add_genre(movie, created_movie)
  add_production_companies(movie, created_movie)
  add_spoken_languages(movie, created_movie)
  add_production_countries(movie, created_movie)
  add_movie_videos(movie, created_movie)
end

def add_genre(movie, created_movie)
  genres = movie.genres
  genres.each do |genre|
    _genre = Genre.find_by(tmdb_id: genre.id)
    if _genre
      created_movie.genres << _genre
    else
      created_movie.genres.create!(
        tmdb_id: genre.id,
        name: genre.name
      )
    end
  end
end

def add_production_companies(movie, created_movie)
  production_companies = movie.production_companies
  production_companies.each do |pr|
    _pr = Production.find_by(tmdb_id: pr.id)
    if _pr
      created_movie.production_companies << _pr
    else
      created_movie.production_companies.create!(
        tmdb_id: pr.id,
        logo_path: pr.logo_path,
        name: pr.name,
        origin_country: pr.origin_country
      )
    end
  end
end

def add_spoken_languages(movie, created_movie)
  spoken_languages = movie.spoken_languages
  spoken_languages.each do |sl|
    _sl = SpokenLanguage.find_by(iso_639_1: sl.iso_639_1)
    if _sl
      created_movie.spoken_languages << _sl
    else
      created_movie.spoken_languages.create!(
        name: sl.name,
        iso_639_1: sl.iso_639_1
      )
    end
  end
end

def add_production_countries(movie, created_movie)
  production_countries = movie.production_countries
  production_countries.each do |pc|
    _pc = Country.find_by(iso_3166_1: pc.iso_3166_1)
    if _pc
      created_movie.production_countries << _pc
    else
      created_movie.production_countries.create!(
        name: pc.name,
        iso_3166_1: pc.iso_3166_1
      )
    end
  end
end

def add_movie_videos(movie, created_movie)
  sleep 0.2
  videos = Tmdb::Movie.videos(movie.id)
  videos.each do |vid|
    _vid = MovieVideo.find_by(key: vid.key)
    if _vid
      created_movie.videos << _vid
    else
      created_movie.videos.create!(
        tmdb_id: vid.id,
        iso_639_1: vid.iso_639_1,
        iso_3166_1: vid.iso_3166_1,
        key: vid.key,
        name: vid.name,
        site: vid.site,
        size: vid.size,
        video_type: vid.type
      )
    end
  end
end

#CREATE NEW MOVIES
puts "Adding Movies to database".colorize(:light_blue)
MOVIES.each_line do |movie|
  movie_id = JSON.parse(movie)['id']
  if EXISTING_MOVIES.include?(movie_id)
    if CHANGED_MOVIES_IDS.include?(movie_id)
      update_movie(movie_id)
    else
      puts "Skipping existing movie".colorize(:yellow)
    end
    next
  end
  sleep 0.3
  begin
  movie = Tmdb::Movie.detail(movie_id)
  created_movie = create_movie(movie)
  add_relations(movie, created_movie)
  rescue => error
    puts "#{error} could not be added :(".colorize(:red)
    next
  end
  puts "Added #{movie.title} #{movie.id}".colorize(:green)
  sleep 0.2
end
