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

ActiveRecord::Schema.define(version: 20171109045402) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movies", force: :cascade do |t|
    t.integer "vote_count"
    t.integer "tmdb_id"
    t.boolean "video"
    t.integer "vote_average"
    t.string "title"
    t.integer "popularity"
    t.string "poster_path"
    t.integer "original_language"
    t.integer "original_title"
    t.text "genre_ids", default: [], array: true
    t.integer "backdrop_path"
    t.boolean "adult"
    t.text "overview"
    t.string "release_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adult"], name: "index_movies_on_adult"
    t.index ["original_title"], name: "index_movies_on_original_title"
    t.index ["popularity"], name: "index_movies_on_popularity"
    t.index ["release_date"], name: "index_movies_on_release_date"
    t.index ["title"], name: "index_movies_on_title"
    t.index ["tmdb_id"], name: "index_movies_on_tmdb_id"
  end

end
