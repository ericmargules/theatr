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

ActiveRecord::Schema.define(version: 20170802173235) do

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

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin",                  default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
