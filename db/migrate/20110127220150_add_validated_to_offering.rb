class AddValidatedToOffering < ActiveRecord::Migration
  def self.up
    add_column :offerings, :validated, :boolean
  end

  def self.down
    remove_column :offerings, :validated
  end
end
