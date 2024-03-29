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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 3) do

  create_table "accounts", :force => true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "role"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "instruments", :force => true do |t|
    t.string   "name"
    t.string   "version"
    t.text     "start_script"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "keyboards", :force => true do |t|
    t.string   "name"
    t.string   "picture_url"
    t.string   "maker"
    t.boolean  "used"
    t.text     "midi_leared_keys"
    t.boolean  "has_faders"
    t.boolean  "has_wheel"
    t.boolean  "has_pads"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
