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

ActiveRecord::Schema[7.0].define(version: 2023_06_08_173942) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "excavators", force: :cascade do |t|
    t.bigint "ticket_id", null: false
    t.string "company_name"
    t.string "address"
    t.string "crew_on_site"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_name"], name: "index_excavators_on_company_name"
    t.index ["crew_on_site"], name: "index_excavators_on_crew_on_site"
    t.index ["ticket_id"], name: "index_excavators_on_ticket_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "request_number"
    t.string "sequence_number"
    t.string "request_type"
    t.string "request_action"
    t.datetime "response_due_datetime"
    t.string "primary_service_area_code"
    t.string "additional_service_area_codes"
    t.string "digsite_well_known_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["primary_service_area_code"], name: "index_tickets_on_primary_service_area_code"
    t.index ["request_number"], name: "index_tickets_on_request_number", unique: true
    t.index ["response_due_datetime"], name: "index_tickets_on_response_due_datetime"
  end

  add_foreign_key "excavators", "tickets"
end
