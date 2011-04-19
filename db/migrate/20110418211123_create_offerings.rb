class CreateOfferings < ActiveRecord::Migration
  def self.up
    create_table :offerings do |t|
      t.integer :location_id
      t.integer :type_id
      t.integer :plan_id
      t.integer :coordinator_id
      t.string :title
      t.string :specific_location
      t.string :link
      t.string :description
      t.text :note
      t.text :unregistered_artists
      t.date :registration_begins, :default => Date.today
      t.date :registration_deadline
      t.date :start_date
      t.boolean :validated, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :offerings
  end
end
