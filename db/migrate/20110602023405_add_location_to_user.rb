class AddLocationToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :country, :string
    add_column :users, :postal_code, :string
    add_column :users, :address_line_1, :string
    add_column :users, :address_line_2, :string
    add_column :users, :phone_number, :string
  end

  def self.down
    remove_column :users, :phone_number
    remove_column :users, :address_line_2
    remove_column :users, :address_line_1
    remove_column :users, :postal_code
    remove_column :users, :country
  end
end
