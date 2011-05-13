class AddThingsToProfile < ActiveRecord::Migration
  def self.up
    add_column :profiles, :frequency, :string
    add_column :profiles, :specific_location, :string
    remove_column :profiles, :others
  end

  def self.down
    remove_column :profiles, :specific_location
    remove_column :profiles, :frequency
  end
end
