class AddHeightToAd < ActiveRecord::Migration
  def self.up
    add_column :ads, :height, :integer
  end

  def self.down
    remove_column :ads, :height
  end
end
