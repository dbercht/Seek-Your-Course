class AddFieldsToOffering < ActiveRecord::Migration
  def self.up
    add_column :offerings, :number_of_participants, :string
    add_column :offerings, :price_range, :string
  end

  def self.down
    remove_column :offerings, :price_range
    remove_column :offerings, :number_of_participants
  end
end
