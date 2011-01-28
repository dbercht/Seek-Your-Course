# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110127220150) do

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.string   "number"
    t.string   "email"
    t.integer  "offering_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instructors", :force => true do |t|
    t.string   "last_name",   :limit => 14
    t.integer  "offering_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
  end

  create_table "offerings", :force => true do |t|
    t.string   "title"
    t.string   "location"
    t.string   "state"
    t.date     "registration_begins"
    t.date     "registration_deadline"
    t.string   "link"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "type_id"
    t.integer  "topic_id"
    t.boolean  "validated"
  end

  create_table "offerings_topics", :id => false, :force => true do |t|
    t.integer "offering_id"
    t.integer "topic_id"
  end

  create_table "topics", :force => true do |t|
    t.string   "category"
    t.integer  "offering_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "types", :force => true do |t|
    t.string   "category"
    t.integer  "offering_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
