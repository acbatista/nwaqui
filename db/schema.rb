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

ActiveRecord::Schema.define(version: 20160309161819) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status",     default: true
    t.string   "region"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "attributes", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "blocks", force: :cascade do |t|
    t.integer  "group_id"
    t.string   "name"
    t.string   "tour_360"
    t.string   "complete_address"
    t.string   "reference_point"
    t.string   "cep"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "blocks", ["group_id"], name: "index_blocks_on_group_id", using: :btree

  create_table "bookmark_lists", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bookmark_lists", ["user_id"], name: "index_bookmark_lists_on_user_id", using: :btree

  create_table "bookmarks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "property_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "bookmarks", ["property_id"], name: "index_bookmarks_on_property_id", using: :btree
  add_index "bookmarks", ["user_id"], name: "index_bookmarks_on_user_id", using: :btree

  create_table "buttons", force: :cascade do |t|
    t.integer  "order"
    t.string   "image"
    t.string   "name"
    t.boolean  "publish"
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "creci"
    t.string   "logo_path"
    t.string   "social_reason"
    t.string   "fantasy_name"
    t.string   "cnpj"
    t.string   "cpf"
    t.integer  "type_client",           default: 0
    t.string   "address"
    t.string   "cep"
    t.string   "uf"
    t.string   "city"
    t.string   "contact_email"
    t.string   "cadastre_email"
    t.string   "telephone"
    t.string   "celphone"
    t.string   "responsible_telephone"
    t.string   "responsible_name"
    t.string   "username"
    t.string   "password"
    t.string   "token"
    t.boolean  "token_status",          default: true
    t.date     "last_signed"
    t.boolean  "status",                default: true
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "customers", ["username"], name: "index_customers_on_username", unique: true, using: :btree

  create_table "groups", force: :cascade do |t|
    t.integer  "address_id"
    t.string   "name"
    t.string   "tour_360"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "groups", ["address_id"], name: "index_groups_on_address_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "customer_id"
    t.string   "email"
    t.string   "name"
    t.text     "content"
    t.string   "telephone"
    t.string   "celphone"
    t.boolean  "read"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "messages", ["customer_id"], name: "index_messages_on_customer_id", using: :btree

  create_table "properties", force: :cascade do |t|
    t.integer  "situation",              default: 0
    t.integer  "type_property",          default: 0
    t.integer  "commercial_situation",   default: 0
    t.boolean  "status",                 default: true
    t.string   "iptu"
    t.date     "expiration_date"
    t.string   "cep"
    t.string   "uf"
    t.string   "city"
    t.string   "region"
    t.string   "general_address"
    t.string   "general_group"
    t.string   "general_block"
    t.string   "number"
    t.string   "complement"
    t.string   "reference_point"
    t.string   "name"
    t.integer  "rooms",                  default: 0
    t.string   "unit"
    t.float    "value",                  default: 0.0
    t.integer  "suit",                   default: 0
    t.float    "value_m2",               default: 0.0
    t.float    "area",                   default: 0.0
    t.integer  "parking_spaces",         default: 0
    t.integer  "floor",                  default: 0
    t.string   "sun_position"
    t.float    "value_rent",             default: 0.0
    t.integer  "property_attributes_id", default: [],                 array: true
    t.integer  "customer_id"
    t.text     "description"
    t.boolean  "elevator",               default: false
    t.boolean  "coverage",               default: false
    t.integer  "block_id"
    t.integer  "group_id"
    t.integer  "address_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "properties", ["address_id"], name: "index_properties_on_address_id", using: :btree
  add_index "properties", ["block_id"], name: "index_properties_on_block_id", using: :btree
  add_index "properties", ["commercial_situation"], name: "index_properties_on_commercial_situation", using: :btree
  add_index "properties", ["customer_id"], name: "index_properties_on_customer_id", using: :btree
  add_index "properties", ["group_id"], name: "index_properties_on_group_id", using: :btree
  add_index "properties", ["situation"], name: "index_properties_on_situation", using: :btree
  add_index "properties", ["type_property"], name: "index_properties_on_type_property", using: :btree

  create_table "property_images", force: :cascade do |t|
    t.integer  "property_id"
    t.string   "image"
    t.integer  "order"
    t.string   "name"
    t.boolean  "publish"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "property_images", ["property_id"], name: "index_property_images_on_property_id", using: :btree

  create_table "specials", force: :cascade do |t|
    t.integer  "property_id"
    t.integer  "order"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "specials", ["property_id"], name: "index_specials_on_property_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "bio"
    t.string   "avatar"
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.string   "telephone"
    t.string   "token"
    t.boolean  "token_status",     default: true
    t.date     "last_signed"
    t.boolean  "status",           default: true
    t.integer  "user_type",        default: 0
    t.integer  "customer_id",      default: [],                array: true
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "uid"
    t.string   "provider"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "specials", "properties"
end
