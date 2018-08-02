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

ActiveRecord::Schema.define(version: 20170530102949) do

  create_table "dealers", force: :cascade do |t|
    t.string   "firstcard_1"
    t.string   "secondcard_1"
    t.string   "thirdcard_1"
    t.string   "firstcard_2"
    t.string   "secondcard_2"
    t.string   "thirdcard_2"
    t.string   "firstcard_3"
    t.string   "secondcard_3"
    t.string   "thirdcard_3"
    t.string   "firstcard_4"
    t.string   "secondcard_4"
    t.string   "thirdcard_4"
    t.string   "firstcard_5"
    t.string   "secondcard_5"
    t.string   "thirdcard_5"
    t.string   "firstcard_6"
    t.string   "secondcard_6"
    t.string   "thirdcard_6"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "player1s", force: :cascade do |t|
    t.string   "firstcard"
    t.string   "secondcard"
    t.string   "thirdcard"
    t.string   "fourthcard"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player2s", force: :cascade do |t|
    t.string   "firstcard"
    t.string   "secondcard"
    t.string   "thirdcard"
    t.string   "fourthcard"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rounds", force: :cascade do |t|
    t.integer  "turn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
