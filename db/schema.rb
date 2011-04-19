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

ActiveRecord::Schema.define(:version => 20110418211123) do

  create_table "locations", :force => true do |t|
    t.string   "state"
    t.integer  "region_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offerings", :force => true do |t|
    t.integer  "location_id"
    t.integer  "type_id"
    t.integer  "plan_id"
    t.integer  "coordinator_id"
    t.string   "title"
    t.string   "specific_location"
    t.string   "link"
    t.string   "description"
    t.text     "note"
    t.text     "unregistered_artists"
    t.date     "registration_begins",   :default => '2011-04-18'
    t.date     "registration_deadline"
    t.date     "start_date"
    t.boolean  "validated",             :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offerings_topics", :id => false, :force => true do |t|
    t.integer "offering_id"
    t.integer "topic_id"
  end

  create_table "offerings_users", :id => false, :force => true do |t|
    t.integer "offering_id"
    t.integer "user_id"
  end

  create_table "plans", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", :force => true do |t|
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "types", :force => true do |t|
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.boolean  "is_admin",          :default => false
    t.string   "persistence_token"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
