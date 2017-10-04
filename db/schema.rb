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

ActiveRecord::Schema.define(version: 20171003150517) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body"
    t.string   "resource_id",   limit: 255, null: false
    t.string   "resource_type", limit: 255, null: false
    t.integer  "author_id"
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "android_updates", force: :cascade do |t|
    t.integer  "version"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "apk_update_file_name",    limit: 255
    t.string   "apk_update_content_type", limit: 255
    t.integer  "apk_update_file_size"
    t.datetime "apk_update_updated_at"
    t.string   "name",                    limit: 255
  end

  create_table "api_keys", force: :cascade do |t|
    t.string   "access_token", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "device_sync_entries", force: :cascade do |t|
    t.integer  "current_version"
    t.string   "current_language",  limit: 255
    t.string   "device_uuid",       limit: 255
    t.string   "device_label",      limit: 255
    t.string   "timezone",          limit: 255
    t.string   "participant_types", limit: 255
    t.integer  "participant_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devices", force: :cascade do |t|
    t.string   "uuid",       limit: 255
    t.string   "label",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participant_properties", force: :cascade do |t|
    t.integer  "property_id"
    t.string   "value",            limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uuid",             limit: 255
    t.string   "participant_uuid", limit: 255
    t.datetime "deleted_at"
  end

  add_index "participant_properties", ["deleted_at"], name: "index_participant_properties_on_deleted_at"

  create_table "participant_type_translations", force: :cascade do |t|
    t.string   "label",               limit: 255
    t.integer  "participant_type_id"
    t.string   "alignment",           limit: 255
    t.string   "language",            limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participant_types", force: :cascade do |t|
    t.string   "label",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "participant_types", ["deleted_at"], name: "index_participant_types_on_deleted_at"

  create_table "participants", force: :cascade do |t|
    t.integer  "participant_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uuid",                limit: 255
    t.datetime "deleted_at"
    t.string   "device_uuid",         limit: 255, default: ""
    t.string   "device_label",        limit: 255, default: ""
    t.integer  "project_id"
    t.boolean  "active",                          default: false
    t.string   "validator_value",     limit: 255, default: ""
  end

  add_index "participants", ["deleted_at"], name: "index_participants_on_deleted_at"
  add_index "participants", ["project_id"], name: "index_participants_on_project_id"

  create_table "projects", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "projects", ["deleted_at"], name: "index_projects_on_deleted_at"

  create_table "properties", force: :cascade do |t|
    t.string   "label",               limit: 255
    t.string   "type_of",             limit: 255
    t.boolean  "required"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "participant_type_id"
    t.datetime "deleted_at"
    t.boolean  "use_as_label",                    default: false
    t.string   "validator",           limit: 255, default: ""
    t.boolean  "include_in_metadata",             default: false
    t.boolean  "sorting_property",                default: false
  end

  add_index "properties", ["deleted_at"], name: "index_properties_on_deleted_at"

  create_table "relationship_types", force: :cascade do |t|
    t.integer  "participant_type_owner_id"
    t.integer  "participant_type_related_id"
    t.string   "label",                       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "relationship_types", ["deleted_at"], name: "index_relationship_types_on_deleted_at"

  create_table "relationships", force: :cascade do |t|
    t.integer  "relationship_type_id"
    t.string   "participant_owner_uuid",   limit: 255
    t.string   "uuid",                     limit: 255
    t.string   "participant_related_uuid", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "relationships", ["deleted_at"], name: "index_relationships_on_deleted_at"

  create_table "responses", force: :cascade do |t|
    t.string   "survey_uuid",         limit: 255
    t.integer  "question_id"
    t.text     "text"
    t.text     "other_response"
    t.string   "special_response",    limit: 255
    t.datetime "time_started"
    t.datetime "time_ended"
    t.string   "question_identifier", limit: 255
    t.string   "uuid",                limit: 255
    t.integer  "question_version"
    t.integer  "device_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rosters", force: :cascade do |t|
    t.string   "uuid",                      limit: 255
    t.string   "identifier",                limit: 255
    t.string   "instrument_title",          limit: 255
    t.integer  "instrument_id"
    t.integer  "instrument_version_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "surveys", force: :cascade do |t|
    t.integer  "instrument_id"
    t.integer  "instrument_version_number"
    t.string   "device_uuid",               limit: 255
    t.string   "device_label",              limit: 255
    t.string   "uuid",                      limit: 255
    t.string   "instrument_title",          limit: 255
    t.string   "latitude",                  limit: 255
    t.string   "longitude",                 limit: 255
    t.text     "metadata"
    t.boolean  "has_critical_responses"
    t.string   "roster_uuid",               limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_projects", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "authentication_token",   limit: 255
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "version_associations", force: :cascade do |t|
    t.integer "version_id"
    t.string  "foreign_key_name", null: false
    t.integer "foreign_key_id"
  end

  add_index "version_associations", ["foreign_key_name", "foreign_key_id"], name: "index_version_associations_on_foreign_key"
  add_index "version_associations", ["version_id"], name: "index_version_associations_on_version_id"

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",                         null: false
    t.integer  "item_id",                           null: false
    t.string   "event",                             null: false
    t.string   "whodunnit"
    t.text     "object",         limit: 1073741823
    t.datetime "created_at"
    t.integer  "transaction_id"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  add_index "versions", ["transaction_id"], name: "index_versions_on_transaction_id"

end
