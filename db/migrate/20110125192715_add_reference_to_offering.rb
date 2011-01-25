class AddReferenceToOffering < ActiveRecord::Migration
  def self.up
    add_column :offerings, :type_id, :integer
  end

  def self.down
    remove_column :offerings, :type_id
  end
end
