class AddUnregisteredartistsToOffering < ActiveRecord::Migration
  def self.up
    add_column :offerings, :unregistered_artist, :text
  end

  def self.down
    remove_column :offerings, :unregistered_artist
  end
end
