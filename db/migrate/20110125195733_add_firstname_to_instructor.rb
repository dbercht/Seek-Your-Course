class AddFirstnameToInstructor < ActiveRecord::Migration
  def self.up
    add_column :instructors, :first_name, :string
  end

  def self.down
    remove_column :instructors, :first_name
  end
end
