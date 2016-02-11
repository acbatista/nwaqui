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

ActiveRecord::Schema.define(version: 20160203154217) do

  create_table "attributes", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "customers", force: :cascade do |t|
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
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "client_id"
    t.text     "content"
    t.string   "name"
    t.string   "email"
    t.string   "telephone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "messages", ["client_id"], name: "index_messages_on_client_id"

  create_table "projects", force: :cascade do |t|
    t.integer  "customer_id"
    t.string   "image_path"
    t.string   "name"
    t.string   "description"
    t.boolean  "status",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "projects", ["customer_id"], name: "index_projects_on_customer_id"

  create_table "properties", force: :cascade do |t|
    t.integer  "situation",                 default: 0
    t.integer  "type_property",             default: 0
    t.boolean  "status",                    default: true
    t.string   "iptu"
    t.date     "expiration_date"
    t.string   "cep"
    t.string   "uf"
    t.string   "city"
    t.string   "region"
    t.string   "district"
    t.string   "address"
    t.string   "group"
    t.string   "number"
    t.string   "block"
    t.string   "complement"
    t.string   "reference_point"
    t.boolean  "address_link_visible"
    t.boolean  "complement_link_visible"
    t.string   "name"
    t.integer  "rooms",                     default: 0
    t.string   "unit"
    t.float    "value",                     default: 0.0
    t.integer  "suit",                      default: 0
    t.float    "value_m2",                  default: 0.0
    t.float    "area",                      default: 0.0
    t.integer  "parking_spaces",            default: 0
    t.integer  "floor",                     default: 0
    t.string   "sun_position"
    t.string   "link_tour"
    t.float    "value_rent",                default: 0.0
    t.integer  "customer_id"
    t.integer  "project_id"
    t.integer  "attribute_id"
    t.integer  "construction_companies_id"
    t.integer  "sellers_id"
    t.text     "description"
    t.boolean  "commercial",                default: false
    t.boolean  "elevator",                  default: false
    t.boolean  "coverage",                  default: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "properties", ["customer_id"], name: "index_properties_on_customer_id"
  add_index "properties", ["project_id"], name: "index_properties_on_project_id"
  add_index "properties", ["situation"], name: "index_properties_on_situation"
  add_index "properties", ["type_property"], name: "index_properties_on_type_property"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "bio"
    t.string   "avatar"
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.string   "telephone"
    t.string   "token"
    t.boolean  "token_status", default: true
    t.date     "last_signed"
    t.boolean  "status",       default: true
    t.integer  "user_type",    default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
