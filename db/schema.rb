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

ActiveRecord::Schema.define(version: 20151121042947) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "announcement_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "announcements", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "announcement_type_id"
    t.integer  "procurement_entity_id"
    t.integer  "budget_source_id"
    t.date     "open_register_date"
    t.date     "close_submit_date"
    t.date     "open_bid_doc_date"
    t.boolean  "public"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "announcement_file_file_name"
    t.string   "announcement_file_content_type"
    t.integer  "announcement_file_file_size"
    t.datetime "announcement_file_updated_at"
    t.string   "bidding_file_file_name"
    t.string   "bidding_file_content_type"
    t.integer  "bidding_file_file_size"
    t.datetime "bidding_file_updated_at"
  end

  add_index "announcements", ["announcement_type_id"], name: "index_announcements_on_announcement_type_id", using: :btree
  add_index "announcements", ["budget_source_id"], name: "index_announcements_on_budget_source_id", using: :btree
  add_index "announcements", ["procurement_entity_id"], name: "index_announcements_on_procurement_entity_id", using: :btree

  create_table "awarding_contracts", force: :cascade do |t|
    t.string   "title",                       limit: 80, null: false
    t.text     "description"
    t.string   "attachment_doc_file_name"
    t.string   "attachment_doc_content_type"
    t.integer  "attachment_doc_file_size"
    t.datetime "attachment_doc_updated_at"
    t.integer  "procurement_method_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "awarding_contracts", ["procurement_method_id"], name: "index_awarding_contracts_on_procurement_method_id", using: :btree

  create_table "budget_sources", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "location_name", limit: 80, null: false
    t.string   "email_one"
    t.string   "email_two"
    t.string   "email_three"
    t.string   "phone_one"
    t.string   "phone_two"
    t.string   "phone_three"
    t.text     "address_one"
    t.text     "address_two"
    t.text     "address_three"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "faqs", force: :cascade do |t|
    t.text     "question",   null: false
    t.text     "answer",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "law_categories", force: :cascade do |t|
    t.string   "name",       limit: 80, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "law_regulations", force: :cascade do |t|
    t.string   "title",                           limit: 50
    t.string   "description"
    t.string   "thumbnail_file_name"
    t.string   "thumbnail_content_type"
    t.integer  "thumbnail_file_size"
    t.datetime "thumbnail_updated_at"
    t.string   "law_doc_attachment_file_name"
    t.string   "law_doc_attachment_content_type"
    t.integer  "law_doc_attachment_file_size"
    t.datetime "law_doc_attachment_updated_at"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "law_category_id"
  end

  add_index "law_regulations", ["law_category_id"], name: "index_law_regulations_on_law_category_id", using: :btree

  create_table "org_structure_categories", force: :cascade do |t|
    t.string   "name",       limit: 80, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "org_structures", force: :cascade do |t|
    t.string   "title",                            null: false
    t.text     "description"
    t.string   "org_structure_image_file_name"
    t.string   "org_structure_image_content_type"
    t.integer  "org_structure_image_file_size"
    t.datetime "org_structure_image_updated_at"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "org_structure_category_id"
  end

  add_index "org_structures", ["org_structure_category_id"], name: "index_org_structures_on_org_structure_category_id", using: :btree

  create_table "procurement_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "procurement_entities", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "address"
    t.string   "website"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "procurement_category_id"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  add_index "procurement_entities", ["procurement_category_id"], name: "index_procurement_entities_on_procurement_category_id", using: :btree

  create_table "procurement_methods", force: :cascade do |t|
    t.string   "name",       limit: 80, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "procurement_plans", force: :cascade do |t|
    t.string   "name"
    t.integer  "procurement_entity_id"
    t.string   "year"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "procurement_plan_type"
    t.string   "procurement_plan_file_file_name"
    t.string   "procurement_plan_file_content_type"
    t.integer  "procurement_plan_file_file_size"
    t.datetime "procurement_plan_file_updated_at"
  end

  add_index "procurement_plans", ["procurement_entity_id"], name: "index_procurement_plans_on_procurement_entity_id", using: :btree

  create_table "public_services", force: :cascade do |t|
    t.string   "name"
    t.string   "position"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "semester_year_pmfs", force: :cascade do |t|
    t.string   "title",                        null: false
    t.string   "year"
    t.string   "file_attachment_file_name"
    t.string   "file_attachment_content_type"
    t.integer  "file_attachment_file_size"
    t.datetime "file_attachment_updated_at"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "user_profiles", force: :cascade do |t|
    t.integer  "admin_id"
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "announcements", "announcement_types"
  add_foreign_key "announcements", "budget_sources"
  add_foreign_key "announcements", "procurement_entities"
  add_foreign_key "awarding_contracts", "procurement_methods"
  add_foreign_key "law_regulations", "law_categories"
  add_foreign_key "org_structures", "org_structure_categories"
  add_foreign_key "procurement_entities", "procurement_categories"
  add_foreign_key "procurement_plans", "procurement_entities"
end
