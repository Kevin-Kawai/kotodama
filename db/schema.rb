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

ActiveRecord::Schema.define(version: 2019_07_02_130927) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "resources", force: :cascade do |t|
    t.bigint "subject_id"
    t.string "url"
    t.string "language"
    t.index ["subject_id"], name: "index_resources_on_subject_id"
  end

  create_table "sections", force: :cascade do |t|
    t.bigint "resource_id"
    t.string "url"
    t.string "title"
    t.index ["resource_id"], name: "index_sections_on_resource_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
  end

end
