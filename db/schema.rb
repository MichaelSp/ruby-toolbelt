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

ActiveRecord::Schema.define(version: 20150321225132) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_projects", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "project_id",  null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.float    "popularity"
    t.string   "website"
    t.string   "rdoc"
    t.string   "wiki"
    t.string   "source_code"
    t.string   "bug_tracker"
    t.string   "mailing_list"
    t.integer  "downloads"
    t.integer  "releases"
    t.string   "latest_version"
    t.datetime "released_at"
    t.datetime "first_released_at"
    t.integer  "depending_gems"
    t.string   "github"
    t.integer  "watchers"
    t.integer  "forks"
    t.float    "activity"
    t.datetime "last_commit_at"
    t.datetime "first_commit_at"
    t.string   "contributors"
    t.integer  "issues"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

end
