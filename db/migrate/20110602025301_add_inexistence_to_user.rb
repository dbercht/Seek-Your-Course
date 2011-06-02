class AddInexistenceToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :facebook_inexistant, :boolean
    add_column :users, :twitter_inexistante, :boolean
  end

  def self.down
    remove_column :users, :twitter_inexistante
    remove_column :users, :facebook_inexistant
  end
end
