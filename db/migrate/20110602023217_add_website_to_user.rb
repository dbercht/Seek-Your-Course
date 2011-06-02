class AddWebsiteToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :website, :string
    add_column :users, :facebook, :string
    add_column :users, :twitter, :string
    add_column :users, :blog, :string
    add_column :users, :flickr, :string
  end

  def self.down
    remove_column :users, :flickr
    remove_column :users, :blog
    remove_column :users, :twitter
    remove_column :users, :facebook
    remove_column :users, :website
  end
end
