class AddWebsitesToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :websites, :string
  end

  def self.down
    remove_column :users, :websites
  end
end
