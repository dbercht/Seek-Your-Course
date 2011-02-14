class AddStartDateToOffering < ActiveRecord::Migration
  def self.up
    add_column :offerings, :start_date, :date
  end

  def self.down
    remove_column :offerings, :start_date
  end
end
