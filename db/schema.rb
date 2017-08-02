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

ActiveRecord::Schema.define(version: 20170801234839) do

  create_table "auditoria", force: :cascade do |t|
    t.string   "name"
    t.integer  "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "poster"
    t.string   "rating"
    t.integer  "length"
    t.boolean  "now_playing"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "showtime_id"
    t.float    "price"
    t.string   "email"
    t.string   "cc_num"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "cc_exp"
    t.index ["showtime_id"], name: "index_orders_on_showtime_id"
  end

  create_table "showtimes", force: :cascade do |t|
    t.date     "date"
    t.integer  "movie_id"
    t.integer  "auditorium_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.time     "time"
    t.index ["auditorium_id"], name: "index_showtimes_on_auditorium_id"
    t.index ["movie_id"], name: "index_showtimes_on_movie_id"
  end

end
