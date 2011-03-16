class AddAvatarColumnsToUser < ActiveRecord::Migration
  def self.up
    add_column :topics, :image_content_type, :string
    add_column :topics, :image_file_size,    :integer
    add_column :topics, :image_updated_at,   :datetime
  end

  def self.down
    remove_column :topics, :image_file_name
    remove_column :topics, :image_content_type
    remove_column :topics, :image_file_size
    remove_column :topics, :image_updated_at
  end
end
