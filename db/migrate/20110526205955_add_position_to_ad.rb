class AddPositionToAd < ActiveRecord::Migration
  def self.up
    add_column :ads, :position, :string
  end

  def self.down
    remove_column :ads, :position
  end
end
