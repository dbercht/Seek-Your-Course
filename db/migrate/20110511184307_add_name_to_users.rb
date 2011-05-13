class AddNameToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :institution_name, :string
  end

  def self.down
    remove_column :users, :institution_name
  end
end
