class AddPicturesToOfferings < ActiveRecord::Migration
  def self.up
    add_column :offerings, :picture_main_file_name,    :string
    add_column :offerings, :picture_main_content_type, :string
    add_column :offerings, :picture_main_file_size,    :integer
    add_column :offerings, :picture_main_updated_at,   :datetime

    add_column :offerings, :picture_footer_left_file_name,    :string
    add_column :offerings, :picture_footer_left_content_type, :string
    add_column :offerings, :picture_footer_left_file_size,    :integer
    add_column :offerings, :picture_footer_left_updated_at,   :datetime

    add_column :offerings, :picture_footer_right_file_name,    :string
    add_column :offerings, :picture_footer_right_content_type, :string
    add_column :offerings, :picture_footer_right_file_size,    :integer
    add_column :offerings, :picture_footer_right_updated_at,   :datetime
  end

  def self.down
    remove_column :offerings, :picture_footer_left_file_name
    remove_column :offerings, :picture_footer_left_content_type
    remove_column :offerings, :picture_footer_left_file_size
    remove_column :offerings, :picture_footer_left_updated_at

    remove_column :offerings, :picture_footer_right_file_name
    remove_column :offerings, :picture_footer_right_content_type
    remove_column :offerings, :picture_footer_right_file_size
    remove_column :offerings, :picture_footer_right_updated_at

    remove_column :offerings, :picture_main_file_name
    remove_column :offerings, :picture_main_content_type
    remove_column :offerings, :picture_main_file_size
    remove_column :offerings, :picture_main_updated_at
  end
end
