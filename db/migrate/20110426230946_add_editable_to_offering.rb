class AddEditableToOffering < ActiveRecord::Migration
  def self.up
    add_column :offerings, :editable, :boolean, :default => true
  end

  def self.down
    remove_column :offerings, :editable
  end
end
