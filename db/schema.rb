# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140706161335) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "athletes", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "dob"
    t.integer  "bib"
    t.integer  "club_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "second_claim", default: false
  end

  add_index "athletes", ["bib"], name: "index_athletes_on_bib", using: :btree
  add_index "athletes", ["club_id"], name: "index_athletes_on_club_id", using: :btree

  create_table "clubs", force: true do |t|
    t.string   "name"
    t.string   "abbr"
    t.string   "contact"
    t.string   "email"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "division"
  end

  add_index "clubs", ["abbr"], name: "index_clubs_on_division_and_abbr", using: :btree
  add_index "clubs", ["division"], name: "index_clubs_on_division", using: :btree

  create_table "clubs_fixtures", id: false, force: true do |t|
    t.integer "club_id",    null: false
    t.integer "fixture_id", null: false
  end

  add_index "clubs_fixtures", ["club_id", "fixture_id"], name: "index_clubs_fixtures_on_club_id_and_fixture_id", using: :btree

  create_table "fixtures", force: true do |t|
    t.date     "date"
    t.string   "location"
    t.integer  "season_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fixtures", ["date"], name: "index_fixtures_on_date", using: :btree
  add_index "fixtures", ["season_id"], name: "index_fixtures_on_season_id", using: :btree

  create_table "race_scores", force: true do |t|
    t.integer  "club_id"
    t.integer  "race_id"
    t.string   "team_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "total"
    t.integer  "scores",     array: true
  end

  add_index "race_scores", ["club_id"], name: "index_race_scores_on_club_id", using: :btree
  add_index "race_scores", ["race_id"], name: "index_race_scores_on_race_id", using: :btree

  create_table "races", force: true do |t|
    t.string   "classification"
    t.integer  "fixture_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "scorers"
    t.boolean  "score_by_division", default: false
    t.boolean  "score_by_category", default: false
  end

  add_index "races", ["fixture_id"], name: "index_races_on_fixture_id", using: :btree

  create_table "results", force: true do |t|
    t.integer  "athlete_id"
    t.integer  "race_id"
    t.integer  "position"
    t.integer  "time"
    t.integer  "division"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "athlete_name"
    t.integer  "points"
    t.integer  "club_id"
  end

  add_index "results", ["athlete_id"], name: "index_results_on_athlete_id", using: :btree
  add_index "results", ["club_id"], name: "index_results_on_club_id", using: :btree
  add_index "results", ["division"], name: "index_results_on_division", using: :btree
  add_index "results", ["race_id"], name: "index_results_on_race_id", using: :btree

  create_table "seasons", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
