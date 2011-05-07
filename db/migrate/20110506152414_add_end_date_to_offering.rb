class AddEndDateToOffering < ActiveRecord::Migration
  def self.up
    add_column :offerings, :end_date, :date
  end

  def self.down
    remove_column :offerings, :end_date
  end
end
