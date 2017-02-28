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

ActiveRecord::Schema.define(version: 20170228015459) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "athlete_scores", force: :cascade do |t|
    t.integer  "wod_id"
    t.integer  "athlete_id"
    t.integer  "place_region"
    t.integer  "place_worldwide"
    t.integer  "version"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["athlete_id"], name: "index_athlete_scores_on_athlete_id", using: :btree
    t.index ["wod_id"], name: "index_athlete_scores_on_wod_id", using: :btree
  end

  create_table "athletes", force: :cascade do |t|
    t.string   "name"
    t.integer  "games_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scrape_scores", force: :cascade do |t|
    t.integer "workoutrank"
    t.string  "workoutresult"
    t.string  "scoreidentifier"
    t.string  "scoredisplay"
    t.string  "video"
  end

  create_table "scrapes", force: :cascade do |t|
    t.integer "competition"
    t.integer "year"
    t.integer "division"
    t.integer "scaled"
    t.integer "fittest"
    t.string  "fittest1"
    t.integer "occupation"
    t.integer "sort"
    t.integer "currentpage"
    t.integer "totalpages"
    t.string  "name"
    t.integer "userid"
    t.string  "overallrank"
    t.string  "overallscore"
    t.string  "regionid"
    t.string  "region"
    t.string  "affiliateid"
    t.string  "affiliate"
    t.integer "age"
    t.integer "highlight"
    t.string  "height"
    t.string  "weight"
    t.string  "profilepic"
    t.integer "batch"
  end

  create_table "wods", force: :cascade do |t|
    t.string   "name"
    t.string   "score_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
