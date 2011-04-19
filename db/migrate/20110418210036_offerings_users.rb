class OfferingsUsers < ActiveRecord::Migration
  def self.up
    create_table :offerings_users, :id => false do |t|
      t.integer "offering_id"
      t.integer "user_id"
    end
  end

  def self.down
    drop_table :offerings_users
  end
end
