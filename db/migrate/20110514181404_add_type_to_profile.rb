class AddTypeToProfile < ActiveRecord::Migration
  def self.up
    add_column :profiles, :role, :string
  end

  def self.down
    remove_column :profiles, :role
  end
end
