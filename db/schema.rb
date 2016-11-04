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

ActiveRecord::Schema.define(version: 20161103173642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.integer  "character_id", null: false
    t.string   "name",         null: false
    t.text     "description"
    t.string   "url"
    t.datetime "modified_at",  null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "characters_comics", id: false, force: :cascade do |t|
    t.integer "character_id"
    t.integer "comic_id"
    t.index ["character_id"], name: "index_characters_comics_on_character_id", using: :btree
    t.index ["comic_id"], name: "index_characters_comics_on_comic_id", using: :btree
  end

  create_table "comics", force: :cascade do |t|
    t.integer  "comic_id",            null: false
    t.string   "title",               null: false
    t.integer  "number"
    t.text     "description"
    t.text     "variant_description"
    t.integer  "pages"
    t.float    "print_price"
    t.float    "digital_price"
    t.datetime "on_sale"
    t.datetime "modified_at",         null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "full_url"
    t.string   "standard_url"
    t.string   "portrait_url"
    t.string   "landscape_url"
    t.string   "imageable_type"
    t.integer  "imageable_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["provider"], name: "index_users_on_provider", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid"], name: "index_users_on_uid", using: :btree
  end

end
