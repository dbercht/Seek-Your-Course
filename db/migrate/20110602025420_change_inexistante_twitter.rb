class ChangeInexistanteTwitter < ActiveRecord::Migration
  def self.up
    rename_column :users, :twitter_inexistante, :twitter_inexistant
  end

  def self.down
  end
end
