# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_04_29_193339) do

  create_table "caffe_items", force: :cascade do |t|
    t.string "name"
    t.string "type_"
    t.integer "price"
    t.string "size"
    t.string "description"
    t.string "poster_url"
  end

  create_table "drivers", force: :cascade do |t|
    t.string "name"
  end

  create_table "passengers", force: :cascade do |t|
    t.string "name"
    t.string "role"
    t.integer "vehicle_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string "origin"
    t.string "destination"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "registration"
    t.string "vehicle_type"
    t.integer "capacity"
    t.integer "driver_id"
    t.integer "route_id"
  end

end
