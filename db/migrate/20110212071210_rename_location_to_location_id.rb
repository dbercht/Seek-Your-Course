class RenameLocationToLocationId < ActiveRecord::Migration
  def self.up
    change_column :offerings, :location, :integer, :null => false
  
    rename_column :offerings, :state, :specific_location
    rename_column :offerings, :location, :location_id
  end

  def self.down
    rename_column :offerings, :location_id, :location
    rename_column :offerings, :specific_location, :state
    raise ActiveRecord::IrreversibleMigration
  end
end
