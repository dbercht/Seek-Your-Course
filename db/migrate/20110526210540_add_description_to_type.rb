class AddDescriptionToType < ActiveRecord::Migration
  def self.up
    add_column :types, :description, :text
  end

  def self.down
    remove_column :types, :description
  end
end
