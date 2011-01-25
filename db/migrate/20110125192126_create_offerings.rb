class CreateOfferings < ActiveRecord::Migration
  def self.up
    create_table :offerings do |t|
      t.string :title
      t.string :location
      t.string :state
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
