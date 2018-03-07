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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120116235928) do

  create_table "book_entries", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companions", :force => true do |t|
    t.string "played_by",   :null => false
    t.text   "description"
    t.string "image"
    t.string "icon"
    t.string "name"
    t.string "required"
  end

  create_table "companions_doctors", :force => true do |t|
    t.integer "doctor_id"
    t.integer "companion_id"
  end

  create_table "companions_entries", :force => true do |t|
    t.integer "entry_id"
    t.integer "companion_id"
  end

  create_table "contributors", :force => true do |t|
    t.string  "name"
    t.text    "description"
    t.integer "entry_id"
  end

  create_table "contributors_entries", :force => true do |t|
    t.integer "entry_id"
    t.integer "contributor_id"
  end

  create_table "doctors", :force => true do |t|
    t.integer "order",       :null => false
    t.string  "played_by",   :null => false
    t.text    "description"
    t.string  "image"
    t.integer "start_year"
    t.integer "end_year"
    t.string  "label"
    t.string  "icon"
  end

  create_table "doctors_entries", :force => true do |t|
    t.integer "entry_id"
    t.integer "doctor_id"
  end

  create_table "entries", :force => true do |t|
    t.string  "title",              :null => false
    t.integer "rating"
    t.text    "description"
    t.date    "released_on"
    t.integer "length"
    t.text    "image"
    t.integer "series_id"
    t.string  "icon"
    t.date    "broadcast_starting"
    t.date    "broadcast_ending"
    t.integer "season"
    t.integer "episode"
    t.integer "episode_count"
    t.string  "type"
    t.string  "format"
    t.string  "status"
    t.integer "publisher_id"
    t.string  "broadcast_status"
  end

  create_table "images", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publishers", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "series", :force => true do |t|
    t.string  "name",              :null => false
    t.text    "description"
    t.string  "image"
    t.string  "category",          :null => false
    t.string  "abbreviation",      :null => false
    t.integer "series_started_on"
    t.integer "series_ended_on"
  end

end
