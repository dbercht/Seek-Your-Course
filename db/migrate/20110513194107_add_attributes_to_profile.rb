class AddAttributesToProfile < ActiveRecord::Migration
  def self.up
    add_column :profiles, :type, :string
    add_column :profiles, :location, :string
    add_column :profiles, :focus, :string
    add_column :profiles, :preferences, :string
    add_column :profiles, :other_links, :string
    add_column :profiles, :description, :text
    add_column :profiles, :others, :string
    add_column :profiles, :testimonials, :string
  end

  def self.down
    remove_column :profiles, :testimonials
    remove_column :profiles, :others
    remove_column :profiles, :description
    remove_column :profiles, :other_links
    remove_column :profiles, :preferences
    remove_column :profiles, :focus
    remove_column :profiles, :location
    remove_column :profiles, :type
  end
end
