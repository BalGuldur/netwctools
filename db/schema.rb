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

ActiveRecord::Schema.define(:version => 20111213111553) do

  create_table "ips", :force => true do |t|
    t.string   "ipaddress"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ips_switches", :force => true do |t|
    t.integer  "ip_id"
    t.integer  "switch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "networks", :force => true do |t|
    t.string   "networkaddress"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "switches", :force => true do |t|
    t.string   "address"
    t.integer  "swmodel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "swmodels", :force => true do |t|
    t.string   "name"
    t.string   "company"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
