class AddUsStateToOffering < ActiveRecord::Migration
  def self.up
    add_column :offerings, :us_state, :string
  end

  def self.down
    remove_column :offerings, :us_state
  end
end
