# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_01_07_205048) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "seasons", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "display_name"
    t.datetime "updated_at", null: false
    t.integer "year"
    t.index ["year"], name: "index_seasons_on_year", unique: true
  end

  create_table "sub_seasons", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "end_date"
    t.bigint "season_id", null: false
    t.date "start_date"
    t.string "subtype"
    t.datetime "updated_at", null: false
    t.integer "year"
    t.index ["season_id"], name: "index_sub_seasons_on_season_id"
    t.index ["year", "subtype"], name: "index_sub_seasons_on_year_and_subtype", unique: true
  end

  add_foreign_key "sub_seasons", "seasons"
end
