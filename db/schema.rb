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

ActiveRecord::Schema.define(version: 20160925145131) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "resumes", force: :cascade do |t|
    t.string   "first_name",     null: false
    t.string   "last_name",      null: false
    t.string   "middle_name"
    t.string   "phone"
    t.string   "email"
    t.integer  "desired_salary", null: false
    t.boolean  "is_active"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "skill_holdings", force: :cascade do |t|
    t.integer  "skillable_id"
    t.string   "skillable_type"
    t.integer  "skill_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "skill_holdings", ["skillable_type", "skillable_id"], name: "index_skill_holdings_on_skillable_type_and_skillable_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vacancies", force: :cascade do |t|
    t.string   "name",           null: false
    t.string   "phone"
    t.string   "email"
    t.string   "extra_contacts"
    t.datetime "expires_at",     null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "salary",         null: false
  end

end
