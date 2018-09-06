# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_09_05_233524) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "iso_3166_1"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["iso_3166_1"], name: "index_countries_on_iso_3166_1"
    t.index ["name"], name: "index_countries_on_name"
  end

  create_table "countries_movies", id: false, force: :cascade do |t|
    t.bigint "movie_id", null: false
    t.bigint "country_id", null: false
    t.index ["country_id", "movie_id"], name: "countries_movies_index"
    t.index ["movie_id", "country_id"], name: "movies_countries_index"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.integer "tmdb_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_genres_on_name"
    t.index ["tmdb_id"], name: "index_genres_on_tmdb_id"
  end

  create_table "genres_movies", id: false, force: :cascade do |t|
    t.bigint "movie_id", null: false
    t.bigint "genre_id", null: false
    t.index ["genre_id", "movie_id"], name: "genres_movies_index"
    t.index ["movie_id", "genre_id"], name: "movies_genres_index"
  end

  create_table "movie_videos", force: :cascade do |t|
    t.string "iso_639_1"
    t.string "iso_3166_1"
    t.string "key"
    t.string "name"
    t.string "site"
    t.integer "size"
    t.string "video_type"
    t.bigint "movie_id"
    t.string "tmdb_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["iso_3166_1"], name: "index_movie_videos_on_iso_3166_1"
    t.index ["iso_639_1"], name: "index_movie_videos_on_iso_639_1"
    t.index ["key"], name: "index_movie_videos_on_key"
    t.index ["movie_id"], name: "index_movie_videos_on_movie_id"
    t.index ["site"], name: "index_movie_videos_on_site"
    t.index ["tmdb_id"], name: "index_movie_videos_on_tmdb_id"
    t.index ["video_type"], name: "index_movie_videos_on_video_type"
  end

  create_table "movies", force: :cascade do |t|
    t.boolean "adult"
    t.string "backdrop_path"
    t.string "budget"
    t.string "homepage"
    t.integer "tmdb_id"
    t.string "imdb_id"
    t.string "original_language"
    t.string "original_title"
    t.text "overview"
    t.decimal "popularity"
    t.string "poster_path"
    t.date "release_date"
    t.integer "revenue"
    t.integer "runtime"
    t.string "status"
    t.text "tagline"
    t.string "title"
    t.boolean "video"
    t.decimal "vote_average"
    t.integer "vote_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adult"], name: "index_movies_on_adult"
    t.index ["imdb_id"], name: "index_movies_on_imdb_id"
    t.index ["original_language"], name: "index_movies_on_original_language"
    t.index ["original_title"], name: "index_movies_on_original_title"
    t.index ["popularity"], name: "index_movies_on_popularity"
    t.index ["release_date"], name: "index_movies_on_release_date"
    t.index ["revenue"], name: "index_movies_on_revenue"
    t.index ["status"], name: "index_movies_on_status"
    t.index ["tagline"], name: "index_movies_on_tagline"
    t.index ["title"], name: "index_movies_on_title"
    t.index ["tmdb_id"], name: "index_movies_on_tmdb_id"
    t.index ["video"], name: "index_movies_on_video"
    t.index ["vote_average"], name: "index_movies_on_vote_average"
    t.index ["vote_count"], name: "index_movies_on_vote_count"
  end

  create_table "movies_productions", id: false, force: :cascade do |t|
    t.bigint "movie_id", null: false
    t.bigint "production_id", null: false
    t.index ["movie_id", "production_id"], name: "movies_productions_index"
    t.index ["production_id", "movie_id"], name: "productions_movies_index"
  end

  create_table "movies_spoken_languages", id: false, force: :cascade do |t|
    t.bigint "movie_id", null: false
    t.bigint "spoken_language_id", null: false
    t.index ["movie_id", "spoken_language_id"], name: "movies_spoken_languages_index"
    t.index ["spoken_language_id", "movie_id"], name: "spoken_languages_movies_index"
  end

  create_table "productions", force: :cascade do |t|
    t.string "logo_path"
    t.string "name"
    t.string "origin_country"
    t.integer "tmdb_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_productions_on_name"
    t.index ["origin_country"], name: "index_productions_on_origin_country"
    t.index ["tmdb_id"], name: "index_productions_on_tmdb_id"
  end

  create_table "spoken_languages", force: :cascade do |t|
    t.string "name"
    t.string "iso_639_1"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["iso_639_1"], name: "index_spoken_languages_on_iso_639_1"
    t.index ["name"], name: "index_spoken_languages_on_name"
  end

  add_foreign_key "movie_videos", "movies"
end
