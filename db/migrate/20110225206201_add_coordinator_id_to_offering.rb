class AddCoordinatorIdToOffering < ActiveRecord::Migration
  def self.up
    add_column :offerings, :coordinator_id, :integer
  end

  def self.down
    remove_column :offerings, :coordinator_id
  end
end
