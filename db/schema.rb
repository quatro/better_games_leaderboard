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

ActiveRecord::Schema.define(version: 20170531201301) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "athletes", force: :cascade do |t|
    t.string   "name"
    t.integer  "userid"
    t.string   "regionid"
    t.string   "division"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regional_scores", force: :cascade do |t|
    t.integer  "athlete_id"
    t.integer  "year"
    t.integer  "workout"
    t.string   "score"
    t.integer  "minutes"
    t.integer  "seconds"
    t.integer  "fraction_seconds"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["athlete_id"], name: "index_regional_scores_on_athlete_id", using: :btree
  end

end
