class AddNotesToOffering < ActiveRecord::Migration
  def self.up
    add_column :offerings, :note, :text
  end

  def self.down
    remove_column :offerings, :note
  end
end
