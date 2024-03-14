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

ActiveRecord::Schema[7.1].define(version: 2024_03_14_015818) do
  create_table "applicants", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "applicants_job_listings", id: false, force: :cascade do |t|
    t.integer "applicant_id", null: false
    t.integer "job_listing_id", null: false
    t.index ["applicant_id", "job_listing_id"], name: "idx_on_applicant_id_job_listing_id_4f1d1dabc1"
    t.index ["job_listing_id", "applicant_id"], name: "idx_on_job_listing_id_applicant_id_9aacb05a94"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "industry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_listings", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_job_listings_on_company_id"
  end

  add_foreign_key "job_listings", "companies"
end
