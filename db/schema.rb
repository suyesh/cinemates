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

ActiveRecord::Schema.define(version: 20171111081748) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movies", force: :cascade do |t|
    t.boolean "adult"
    t.string "backdrop_path"
    t.integer "budget"
    t.string "homepage"
    t.integer "tmdb_id"
    t.string "imdb_id"
    t.string "original_language"
    t.string "original_title"
    t.text "overview"
    t.decimal "popularity"
    t.string "poster_path"
    t.string "release_date"
    t.integer "revenue"
    t.integer "runtime"
    t.string "status"
    t.string "tagline"
    t.string "title"
    t.boolean "video"
    t.decimal "vote_average"
    t.integer "vote_count"
    t.text "genres", default: [], array: true
    t.text "production_companies", default: [], array: true
    t.text "production_countries", default: [], array: true
    t.text "spoken_languages", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imdb_id"], name: "index_movies_on_imdb_id"
    t.index ["original_language"], name: "index_movies_on_original_language"
    t.index ["original_title"], name: "index_movies_on_original_title"
    t.index ["release_date"], name: "index_movies_on_release_date"
    t.index ["revenue"], name: "index_movies_on_revenue"
    t.index ["status"], name: "index_movies_on_status"
    t.index ["title"], name: "index_movies_on_title"
    t.index ["tmdb_id"], name: "index_movies_on_tmdb_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
