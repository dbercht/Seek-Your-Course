class CreateOfferings < ActiveRecord::Migration
  def self.up
    create_table :offerings do |t|
      t.string :title
      t.integer :location_id
      t.string :specific_location
      t.date :registration_begins
      t.date :registration_deadline
      t.string :link
      t.string :description
      t.timestamps
    end
  end

  def self.down
    drop_table :offerings
  end
end
