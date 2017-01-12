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

ActiveRecord::Schema.define(version: 20170112102548) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buyingorders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dishes", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "price"
    t.datetime "ready_time"
    t.integer  "portions"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "orderitem_id"
    t.index ["orderitem_id"], name: "index_dishes_on_orderitem_id", using: :btree
  end

  create_table "orderitems", force: :cascade do |t|
    t.datetime "pickup_time"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "buyingorder_id"
    t.index ["buyingorder_id"], name: "index_orderitems_on_buyingorder_id", using: :btree
  end

  create_table "sellingorders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "dishes", "orderitems"
  add_foreign_key "orderitems", "buyingorders"
end
