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

ActiveRecord::Schema.define(version: 20160526151712) do

  create_table "champions", force: :cascade do |t|
    t.float    "base_hp"
    t.float    "base_hp5"
    t.float    "base_mana"
    t.float    "base_mp5"
    t.float    "base_range"
    t.float    "base_ad"
    t.float    "base_as"
    t.float    "base_armor"
    t.float    "base_mr"
    t.float    "base_ms"
    t.float    "hp_per_lvl"
    t.float    "hp5_per_lvl"
    t.float    "mana_per_lvl"
    t.float    "mp5_per_lvl"
    t.float    "range_per_lvl"
    t.float    "ad_per_lvl"
    t.float    "as_per_lvl"
    t.float    "armor_per_lvl"
    t.float    "mr_per_lvl"
    t.float    "ms_per_lvl"
    t.text     "description"
    t.text     "passive"
    t.integer  "spell_1_id"
    t.integer  "spell_2_id"
    t.integer  "spell_3_id"
    t.integer  "spell_4_id"
    t.float    "base_crit"
    t.float    "crit_per_lvl"
    t.integer  "image_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "champions", ["image_id"], name: "index_champions_on_image_id"
  add_index "champions", ["spell_1_id"], name: "index_champions_on_spell_1_id"
  add_index "champions", ["spell_2_id"], name: "index_champions_on_spell_2_id"
  add_index "champions", ["spell_3_id"], name: "index_champions_on_spell_3_id"
  add_index "champions", ["spell_4_id"], name: "index_champions_on_spell_4_id"

  create_table "images", force: :cascade do |t|
    t.string   "full"
    t.string   "group"
    t.integer  "h"
    t.string   "sprite"
    t.integer  "w"
    t.integer  "x"
    t.integer  "y"
    t.integer  "z"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spells", force: :cascade do |t|
    t.text     "cooldown"
    t.float    "cooldown_burn"
    t.text     "cost"
    t.string   "cost_burn"
    t.string   "cost_type"
    t.text     "description"
    t.text     "effect"
    t.text     "effect_burn"
    t.integer  "image_id"
    t.string   "key"
    t.integer  "max_rank"
    t.string   "name"
    t.text     "range"
    t.text     "range_burn"
    t.string   "resource"
    t.text     "sanitized_description"
    t.text     "sanitized_tooltip"
    t.text     "var"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "spells", ["image_id"], name: "index_spells_on_image_id"

end
