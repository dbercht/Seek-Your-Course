class AddBlurbToOffering < ActiveRecord::Migration
  def self.up
    add_column :offerings, :blurb, :text
    add_column :offerings, :featured, :boolean
    add_column :offerings, :featured_date, :date
  end

  def self.down
    remove_column :offerings, :featured_date
    remove_column :offerings, :featured
    remove_column :offerings, :blurb
  end
end
