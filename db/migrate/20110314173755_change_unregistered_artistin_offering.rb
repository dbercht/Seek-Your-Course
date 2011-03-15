class ChangeUnregisteredArtistinOffering < ActiveRecord::Migration
  def self.up
    rename_column :offerings, :unregistered_artist, :unregistered_artists
  end

  def self.down
  end
end
