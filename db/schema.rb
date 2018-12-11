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

ActiveRecord::Schema.define(version: 20181211153200) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "customers", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "galleries", force: true do |t|
    t.string   "title"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "gallery_translations", force: true do |t|
    t.integer  "gallery_id", null: false
    t.string   "locale",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  add_index "gallery_translations", ["gallery_id"], name: "index_gallery_translations_on_gallery_id"
  add_index "gallery_translations", ["locale"], name: "index_gallery_translations_on_locale"

  create_table "image_translations", force: true do |t|
    t.integer  "image_id",   null: false
    t.string   "locale",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "text"
  end

  add_index "image_translations", ["image_id"], name: "index_image_translations_on_image_id"
  add_index "image_translations", ["locale"], name: "index_image_translations_on_locale"

  create_table "images", force: true do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "text"
  end

  create_table "order_service_ids", force: true do |t|
    t.integer  "order_id"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

# Could not dump table "orders" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

# Could not dump table "post_categories" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "post_translations", force: true do |t|
    t.integer  "post_id",    null: false
    t.string   "locale",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "title"
    t.text     "stext"
    t.text     "text"
    t.string   "tags"
  end

  add_index "post_translations", ["locale"], name: "index_post_translations_on_locale"
  add_index "post_translations", ["post_id"], name: "index_post_translations_on_post_id"

  create_table "posts", force: true do |t|
    t.string   "slug"
    t.string   "title"
    t.text     "stext"
    t.text     "text"
    t.string   "tags"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "seo_id"
  end

  add_index "posts", ["seo_id"], name: "index_posts_on_seo_id"

  create_table "posts_post_category_ids", force: true do |t|
    t.integer  "post_id"
    t.integer  "post_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_translations", force: true do |t|
    t.integer  "project_id", null: false
    t.string   "locale",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "url"
    t.string   "title"
    t.string   "subtitle"
    t.text     "text"
    t.text     "tags"
  end

  add_index "project_translations", ["locale"], name: "index_project_translations_on_locale"
  add_index "project_translations", ["project_id"], name: "index_project_translations_on_project_id"

  create_table "projects", force: true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.text     "text"
    t.text     "tags"
    t.text     "url"
    t.boolean  "is_draft"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "seos", force: true do |t|
    t.string   "meta_title"
    t.text     "meta_description"
    t.string   "meta_keywords"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_tarif_prices", force: true do |t|
    t.float    "price"
    t.float    "condition1"
    t.float    "condition2"
    t.integer  "service_tarif_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_tarifs", force: true do |t|
    t.string   "title"
    t.text     "text"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_translations", force: true do |t|
    t.integer  "service_id", null: false
    t.string   "locale",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "text"
    t.text     "stext"
    t.string   "link"
    t.string   "price"
  end

  add_index "service_translations", ["locale"], name: "index_service_translations_on_locale"
  add_index "service_translations", ["service_id"], name: "index_service_translations_on_service_id"

  create_table "services", force: true do |t|
    t.string   "title"
    t.text     "text"
    t.text     "stext"
    t.string   "link"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "is_visible"
  end

  create_table "simple_captcha_data", force: true do |t|
    t.string   "key",        limit: 40
    t.string   "value",      limit: 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "simple_captcha_data", ["key"], name: "idx_key"

  create_table "teamer_translations", force: true do |t|
    t.integer  "teamer_id",  null: false
    t.string   "locale",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "firstname"
    t.string   "secondname"
    t.text     "text"
  end

  add_index "teamer_translations", ["locale"], name: "index_teamer_translations_on_locale"
  add_index "teamer_translations", ["teamer_id"], name: "index_teamer_translations_on_teamer_id"

  create_table "teamers", force: true do |t|
    t.string   "firstname"
    t.string   "secondname"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "login"
    t.boolean  "subscribed", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
