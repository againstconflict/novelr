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

ActiveRecord::Schema.define(version: 20141102000900) do

  create_table "characters", force: true do |t|
    t.string   "name"
    t.integer  "novel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "characters", ["novel_id"], name: "index_characters_on_novel_id"

  create_table "novels", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "premise"
    t.string   "voice"
  end

  create_table "scenes", force: true do |t|
    t.string   "name"
    t.string   "goal"
    t.string   "question"
    t.string   "disaster"
    t.string   "hanger"
    t.integer  "novel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "conflict_text"
    t.string   "emotion"
    t.string   "logic"
    t.string   "decision"
    t.string   "sequel_text"
    t.integer  "row_order"
  end

  add_index "scenes", ["novel_id"], name: "index_scenes_on_novel_id"

  create_table "traits", force: true do |t|
    t.string  "name"
    t.string  "description"
    t.integer "character_id"
  end

  add_index "traits", ["character_id"], name: "index_traits_on_character_id"

end
