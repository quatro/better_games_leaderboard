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

ActiveRecord::Schema.define(version: 20170601012813) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "athletes", force: :cascade do |t|
    t.string   "name"
    t.integer  "userid"
    t.integer  "regionid"
    t.integer  "division"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regional_athlete_scores", force: :cascade do |t|
    t.integer  "regional_athlete_id"
    t.integer  "regional_score_id"
    t.string   "scoredisplay"
    t.integer  "workout"
    t.integer  "rank"
    t.integer  "points"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["regional_athlete_id"], name: "index_regional_athlete_scores_on_regional_athlete_id", using: :btree
    t.index ["regional_score_id"], name: "index_regional_athlete_scores_on_regional_score_id", using: :btree
  end

  create_table "regional_athletes", force: :cascade do |t|
    t.integer  "athlete_id"
    t.string   "athlete_name"
    t.integer  "year"
    t.string   "score_1_display"
    t.string   "score_2_display"
    t.string   "score_3_display"
    t.string   "score_4_display"
    t.string   "score_5_display"
    t.string   "score_6_display"
    t.integer  "score_1_rank",    default: 10000
    t.integer  "score_2_rank",    default: 10000
    t.integer  "score_3_rank",    default: 10000
    t.integer  "score_4_rank",    default: 10000
    t.integer  "score_5_rank",    default: 10000
    t.integer  "score_6_rank",    default: 10000
    t.integer  "rank_overall"
    t.integer  "points_overall"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["athlete_id"], name: "index_regional_athletes_on_athlete_id", using: :btree
  end

  create_table "regional_scores", force: :cascade do |t|
    t.integer  "athlete_id"
    t.integer  "year"
    t.integer  "workout"
    t.string   "score"
    t.integer  "minutes",          default: 10000
    t.integer  "seconds",          default: 10000
    t.integer  "fraction_seconds", default: 10000
    t.integer  "cap_count",        default: 0
    t.boolean  "is_wd",            default: false
    t.string   "scoredisplay"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["athlete_id"], name: "index_regional_scores_on_athlete_id", using: :btree
  end

end
