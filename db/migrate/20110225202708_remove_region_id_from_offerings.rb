class RemoveRegionIdFromOfferings < ActiveRecord::Migration
  def self.up
    remove_column :offerings, :region_id
  end

  def self.down
    add_column :offerings, :region_id, :integer
  end
end
