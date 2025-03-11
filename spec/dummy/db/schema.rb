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

ActiveRecord::Schema[7.2].define(version: 2025_03_11_104419) do
  create_table "clients_management_clients", force: :cascade do |t|
    t.string "name", limit: 128, null: false
    t.string "admin_user_email", null: false
    t.string "contact_email"
    t.string "contact_phone_number"
    t.text "details"
    t.boolean "is_active", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_user_email"], name: "index_clients_management_clients_on_admin_user_email", unique: true
    t.index ["name"], name: "index_clients_management_clients_on_name", unique: true
  end

  create_table "clients_management_domains", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.boolean "is_active", default: false, null: false
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_clients_management_domains_on_client_id"
    t.index ["name"], name: "index_clients_management_domains_on_name", unique: true
  end

  add_foreign_key "clients_management_domains", "clients_management_clients", column: "client_id"
end
