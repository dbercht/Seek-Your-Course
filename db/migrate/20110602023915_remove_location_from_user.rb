class RemoveLocationFromUser < ActiveRecord::Migration
  def self.up
    remove_column :users, :location
    remove_column :users, :websites
  end

  def self.down
  end
end
