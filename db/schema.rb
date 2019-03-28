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

ActiveRecord::Schema.define(version: 20190325074654) do

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.text     "text",       limit: 65535, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["item_id"], name: "index_comments_on_item_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "creditcards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "kind",         null: false
    t.string   "number",       null: false
    t.integer  "expyear",      null: false
    t.integer  "expmonth",     null: false
    t.string   "securitycode", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_creditcards_on_user_id", using: :btree
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "item_id"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_images_on_item_id", using: :btree
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",          null: false
    t.string   "description",   null: false
    t.string   "condition",     null: false
    t.string   "postage",       null: false
    t.string   "region",        null: false
    t.string   "shipping_date", null: false
    t.string   "price",         null: false
    t.integer  "saler_id",      null: false
    t.integer  "buyer_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["buyer_id"], name: "index_items_on_buyer_id", using: :btree
    t.index ["name"], name: "index_items_on_name", using: :btree
    t.index ["saler_id"], name: "index_items_on_saler_id", using: :btree
  end

  create_table "prefectures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nickname",                            null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "lastname",                            null: false
    t.string   "firstname",                           null: false
    t.string   "lastnamekana",                        null: false
    t.string   "firstnamekana",                       null: false
    t.integer  "birthyear",                           null: false
    t.integer  "birthmonth",                          null: false
    t.integer  "birthday",                            null: false
    t.string   "postnumber",                          null: false
    t.integer  "prefecture_id",                       null: false
    t.string   "shikuchouson",                        null: false
    t.string   "banchi",                              null: false
    t.string   "tatemonomei"
    t.string   "phonenumber",                         null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["nickname"], name: "index_users_on_nickname", using: :btree
    t.index ["prefecture_id"], name: "index_users_on_prefecture_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end