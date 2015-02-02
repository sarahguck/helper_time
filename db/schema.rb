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

ActiveRecord::Schema.define(version: 20141206200010) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entries", force: true do |t|
    t.text     "name"
    t.text     "notes"
    t.text     "tags"
    t.text     "format"
    t.text     "visual"
    t.integer  "priority"
    t.integer  "order"
    t.integer  "progress"
    t.integer  "total"
    t.date     "start"
    t.date     "end"
    t.text     "status"
    t.boolean  "daily"
    t.boolean  "daily_completed"
    t.integer  "daily_priority"
    t.integer  "daily_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.text     "content"
    t.text     "tags"
    t.integer  "entry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["entry_id"], name: "index_posts_on_entry_id", using: :btree

  create_table "to_dos", force: true do |t|
    t.text     "name"
    t.text     "notes"
    t.text     "tags"
    t.integer  "entry_id"
    t.boolean  "today"
    t.boolean  "completed"
    t.integer  "priority"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "to_dos", ["entry_id"], name: "index_to_dos_on_entry_id", using: :btree

end
