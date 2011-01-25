class CreateTopics < ActiveRecord::Migration
  def self.up
    create_table :topics do |t|
      t.string :category
      t.references :offering
      t.timestamps
    end
  end

  def self.down
    drop_table :topics
  end
end
