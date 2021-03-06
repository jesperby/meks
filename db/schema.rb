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

ActiveRecord::Schema.define(version: 20161018142144) do

  create_table "countries", force: :cascade do |t|
    t.string   "name",       limit: 191
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "countries", ["name"], name: "index_countries_on_name", unique: true, using: :btree

  create_table "countries_homes", id: false, force: :cascade do |t|
    t.integer "country_id", limit: 4
    t.integer "home_id",    limit: 4
  end

  add_index "countries_homes", ["country_id"], name: "index_countries_homes_on_country_id", using: :btree
  add_index "countries_homes", ["home_id"], name: "index_countries_homes_on_home_id", using: :btree

  create_table "countries_refugees", id: false, force: :cascade do |t|
    t.integer  "country_id", limit: 4
    t.integer  "refugee_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "countries_refugees", ["country_id"], name: "index_countries_refugees_on_country_id", using: :btree
  add_index "countries_refugees", ["refugee_id"], name: "index_countries_refugees_on_refugee_id", using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   limit: 4,     default: 0, null: false
    t.integer  "attempts",   limit: 4,     default: 0, null: false
    t.text     "handler",    limit: 65535,             null: false
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by",  limit: 191
    t.string   "queue",      limit: 191
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "deregistered_reasons", force: :cascade do |t|
    t.string "name", limit: 191
  end

  add_index "deregistered_reasons", ["name"], name: "index_deregistered_reasons_on_name", unique: true, using: :btree

  create_table "dossier_numbers", force: :cascade do |t|
    t.string   "name",       limit: 191
    t.integer  "refugee_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "dossier_numbers", ["name"], name: "index_dossier_numbers_on_name", unique: true, using: :btree
  add_index "dossier_numbers", ["refugee_id"], name: "index_dossier_numbers_on_refugee_id", using: :btree

  create_table "genders", force: :cascade do |t|
    t.string   "name",       limit: 191
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "genders", ["name"], name: "index_genders_on_name", unique: true, using: :btree

  create_table "homes", force: :cascade do |t|
    t.string   "name",                        limit: 191
    t.string   "phone",                       limit: 191
    t.string   "fax",                         limit: 191
    t.string   "address",                     limit: 191
    t.string   "post_code",                   limit: 191
    t.string   "postal_town",                 limit: 191
    t.integer  "owner_type_id",               limit: 4
    t.integer  "guaranteed_seats",            limit: 4
    t.integer  "movable_seats",               limit: 4
    t.boolean  "active",                                    default: true
    t.string   "languages",                   limit: 191
    t.text     "comment",                     limit: 65535
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
    t.boolean  "use_placement_specification",               default: false
  end

  add_index "homes", ["name"], name: "index_homes_on_name", unique: true, using: :btree
  add_index "homes", ["owner_type_id"], name: "index_homes_on_owner_type_id", using: :btree

  create_table "homes_languages", id: false, force: :cascade do |t|
    t.integer "home_id",     limit: 4
    t.integer "language_id", limit: 4
  end

  add_index "homes_languages", ["home_id"], name: "index_homes_languages_on_home_id", using: :btree
  add_index "homes_languages", ["language_id"], name: "index_homes_languages_on_language_id", using: :btree

  create_table "homes_target_groups", id: false, force: :cascade do |t|
    t.integer "home_id",         limit: 4
    t.integer "target_group_id", limit: 4
  end

  add_index "homes_target_groups", ["home_id"], name: "index_homes_target_groups_on_home_id", using: :btree
  add_index "homes_target_groups", ["target_group_id"], name: "index_homes_target_groups_on_target_group_id", using: :btree

  create_table "homes_type_of_housings", id: false, force: :cascade do |t|
    t.integer "home_id",            limit: 4
    t.integer "type_of_housing_id", limit: 4
  end

  add_index "homes_type_of_housings", ["home_id"], name: "index_homes_type_of_housings_on_home_id", using: :btree
  add_index "homes_type_of_housings", ["type_of_housing_id"], name: "index_homes_type_of_housings_on_type_of_housing_id", using: :btree

  create_table "languages", force: :cascade do |t|
    t.string   "name",       limit: 191
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "languages", ["name"], name: "index_languages_on_name", unique: true, using: :btree

  create_table "languages_refugees", id: false, force: :cascade do |t|
    t.integer  "language_id", limit: 4
    t.integer  "refugee_id",  limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "languages_refugees", ["language_id"], name: "index_languages_refugees_on_language_id", using: :btree
  add_index "languages_refugees", ["refugee_id"], name: "index_languages_refugees_on_refugee_id", using: :btree

  create_table "moved_out_reasons", force: :cascade do |t|
    t.string   "name",       limit: 191
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "moved_out_reasons", ["name"], name: "index_moved_out_reasons_on_name", unique: true, using: :btree

  create_table "municipalities", force: :cascade do |t|
    t.string   "name",       limit: 191
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "municipalities", ["name"], name: "index_municipalities_on_name", unique: true, using: :btree

  create_table "owner_types", force: :cascade do |t|
    t.string   "name",       limit: 191
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "owner_types", ["name"], name: "index_owner_types_on_name", unique: true, using: :btree

  create_table "placements", force: :cascade do |t|
    t.integer  "home_id",             limit: 4
    t.integer  "refugee_id",          limit: 4
    t.date     "moved_in_at"
    t.date     "moved_out_at"
    t.integer  "moved_out_reason_id", limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.text     "specification",       limit: 65535
  end

  add_index "placements", ["home_id"], name: "index_placements_on_home_id", using: :btree
  add_index "placements", ["moved_out_reason_id"], name: "index_placements_on_moved_out_reason_id", using: :btree
  add_index "placements", ["refugee_id"], name: "index_placements_on_refugee_id", using: :btree

  create_table "refugees", force: :cascade do |t|
    t.boolean  "draft",                                                    default: false
    t.string   "name",                                       limit: 191
    t.date     "date_of_birth"
    t.string   "ssn_extension",                              limit: 191
    t.string   "dossier_number",                             limit: 191
    t.date     "registered"
    t.date     "deregistered"
    t.date     "residence_permit_at"
    t.date     "checked_out_to_our_city"
    t.date     "temporary_permit_starts_at"
    t.date     "temporary_permit_ends_at"
    t.integer  "municipality_id",                            limit: 4
    t.date     "municipality_placement_migrationsverket_at"
    t.date     "municipality_placement_per_agreement_at"
    t.text     "municipality_placement_comment",             limit: 65535
    t.boolean  "special_needs"
    t.text     "other_relateds",                             limit: 65535
    t.integer  "gender_id",                                  limit: 4
    t.datetime "created_at",                                                               null: false
    t.datetime "updated_at",                                                               null: false
    t.integer  "deregistered_reason_id",                     limit: 4
    t.boolean  "secrecy",                                                  default: false
    t.text     "social_worker",                              limit: 65535
    t.text     "deregistered_comment",                       limit: 65535
    t.date     "citizenship_at"
    t.boolean  "sof_placement",                                            default: false
  end

  add_index "refugees", ["deregistered_reason_id"], name: "index_refugees_on_deregistered_reason_id", using: :btree
  add_index "refugees", ["gender_id"], name: "index_refugees_on_gender_id", using: :btree
  add_index "refugees", ["municipality_id"], name: "index_refugees_on_municipality_id", using: :btree

  create_table "relationships", force: :cascade do |t|
    t.integer  "refugee_id",              limit: 4
    t.integer  "related_id",              limit: 4
    t.integer  "type_of_relationship_id", limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "relationships", ["refugee_id", "related_id"], name: "index_relationships_on_refugee_id_and_related_id", unique: true, using: :btree
  add_index "relationships", ["refugee_id"], name: "index_relationships_on_refugee_id", using: :btree
  add_index "relationships", ["related_id"], name: "index_relationships_on_related_id", using: :btree
  add_index "relationships", ["type_of_relationship_id"], name: "index_relationships_on_type_of_relationship_id", using: :btree

  create_table "ssns", force: :cascade do |t|
    t.date     "date_of_birth"
    t.string   "extension",     limit: 191
    t.integer  "refugee_id",    limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "ssns", ["refugee_id"], name: "index_ssns_on_refugee_id", using: :btree

  create_table "target_groups", force: :cascade do |t|
    t.string   "name",       limit: 191
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "target_groups", ["name"], name: "index_target_groups_on_name", unique: true, using: :btree

  create_table "type_of_housings", force: :cascade do |t|
    t.string   "name",       limit: 191
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "type_of_housings", ["name"], name: "index_type_of_housings_on_name", unique: true, using: :btree

  create_table "type_of_relationships", force: :cascade do |t|
    t.string   "name",       limit: 191
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "type_of_relationships", ["name"], name: "index_type_of_relationships_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",   limit: 191
    t.string   "name",       limit: 191
    t.string   "email",      limit: 191
    t.string   "role",       limit: 191
    t.string   "ip",         limit: 191
    t.datetime "last_login"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "homes", "owner_types"
  add_foreign_key "placements", "moved_out_reasons"
  add_foreign_key "refugees", "deregistered_reasons"
  add_foreign_key "refugees", "genders"
  add_foreign_key "refugees", "municipalities"
  add_foreign_key "relationships", "type_of_relationships"
end
