class CreateAds < ActiveRecord::Migration
  def self.up
    create_table :ads do |t|
      t.string :url
      t.string :tag
      t.string :image_file_name
      t.string :image_content_type
      t.string :image_file_size
      t.datetime :image_updated_at
    end
  end

  def self.down
    drop_table :ads
  end
end
