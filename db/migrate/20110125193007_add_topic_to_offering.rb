class AddTopicToOffering < ActiveRecord::Migration
  def self.up
    add_column :offerings, :topic_id, :integer
  end

  def self.down
    remove_column :offerings, :topic_id
  end
end
