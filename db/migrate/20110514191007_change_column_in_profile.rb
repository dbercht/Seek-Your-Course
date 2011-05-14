class ChangeColumnInProfile < ActiveRecord::Migration
  def self.up
    rename_column :profiles, :type, :coordinating
  end

  def self.down
  end
end
