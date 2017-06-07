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

ActiveRecord::Schema.define(version: 20170607122432) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "slug"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "file_saves", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "commit_message"
    t.integer  "version"
    t.integer  "stream_file_id"
  end

  create_table "stream_files", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "file_name"
    t.string   "file_format"
    t.integer  "stream_id"
  end

  create_table "streams", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "name"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.bigint   "twitch_stream_id"
    t.datetime "twitch_created_at"
    t.string   "twitch_name"
    t.integer  "viewers",           default: 0
    t.boolean  "live",              default: false
    t.integer  "max_viewers",       default: 0
  end

  create_table "streams_sub_categories", id: false, force: :cascade do |t|
    t.integer "sub_category_id"
    t.integer "stream_id"
    t.index ["stream_id"], name: "index_streams_sub_categories_on_stream_id", using: :btree
    t.index ["sub_category_id"], name: "index_streams_sub_categories_on_sub_category_id", using: :btree
  end

  create_table "sub_categories", force: :cascade do |t|
    t.string   "slug"
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_sub_categories_on_category_id", using: :btree
  end

  create_table "tags_streams", force: :cascade do |t|
    t.integer "stream_id"
    t.integer "sub_category_id"
    t.index ["stream_id"], name: "index_tags_streams_on_stream_id", using: :btree
    t.index ["sub_category_id"], name: "index_tags_streams_on_sub_category_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "authentication_token",   limit: 30
    t.string   "first_name"
    t.string   "last_name"
    t.string   "pseudo"
    t.string   "avatar"
    t.boolean  "live"
    t.string   "channel"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
