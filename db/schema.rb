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

ActiveRecord::Schema.define(version: 20140717064633) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "athletes", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "dob"
    t.integer  "bib"
    t.integer  "club_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "second_claim", default: false
    t.index ["bib"], name: "index_athletes_on_bib", using: :btree
    t.index ["club_id"], name: "index_athletes_on_club_id", using: :btree
  end

  create_table "clubs", force: :cascade do |t|
    t.string   "name"
    t.string   "abbr"
    t.string   "contact"
    t.string   "email"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "division"
    t.index ["division"], name: "index_clubs_on_division", using: :btree
  end

  create_table "clubs_fixtures", id: false, force: :cascade do |t|
    t.integer "club_id",    null: false
    t.integer "fixture_id", null: false
    t.index ["club_id", "fixture_id"], name: "index_clubs_fixtures_on_club_id_and_fixture_id", using: :btree
  end

  create_table "fixtures", force: :cascade do |t|
    t.date     "date"
    t.string   "location"
    t.integer  "season_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["date"], name: "index_fixtures_on_date", using: :btree
    t.index ["season_id"], name: "index_fixtures_on_season_id", using: :btree
  end

  create_table "race_scores", force: :cascade do |t|
    t.integer  "club_id"
    t.integer  "race_id"
    t.string   "team_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "total"
    t.integer  "scores",     array: true
    t.string   "category"
    t.index ["club_id"], name: "index_race_scores_on_club_id", using: :btree
    t.index ["race_id"], name: "index_race_scores_on_race_id", using: :btree
  end

  create_table "races", force: :cascade do |t|
    t.string   "classification"
    t.integer  "fixture_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "scorers"
    t.boolean  "score_by_division", default: false
    t.boolean  "score_by_category", default: false
    t.index ["fixture_id"], name: "index_races_on_fixture_id", using: :btree
  end

  create_table "results", force: :cascade do |t|
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
    t.integer  "race_score_id"
    t.index ["athlete_id"], name: "index_results_on_athlete_id", using: :btree
    t.index ["club_id"], name: "index_results_on_club_id", using: :btree
    t.index ["division"], name: "index_results_on_division", using: :btree
    t.index ["race_id"], name: "index_results_on_race_id", using: :btree
  end

  create_table "seasons", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
