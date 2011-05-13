class AddPicturesToProfile < ActiveRecord::Migration
  def self.up
    add_column :profiles, :picture1_file_name,    :string
    add_column :profiles, :picture1_content_type, :string
    add_column :profiles, :picture1_file_size,    :integer
    add_column :profiles, :picture1_updated_at,   :datetime

    add_column :profiles, :picture2_file_name,    :string
    add_column :profiles, :picture2_content_type, :string
    add_column :profiles, :picture2_file_size,    :integer
    add_column :profiles, :picture2_updated_at,   :datetime

    add_column :profiles, :picture3_file_name,    :string
    add_column :profiles, :picture3_content_type, :string
    add_column :profiles, :picture3_file_size,    :integer
    add_column :profiles, :picture3_updated_at,   :datetime

    add_column :profiles, :picture4_file_name,    :string
    add_column :profiles, :picture4_content_type, :string
    add_column :profiles, :picture4_file_size,    :integer
    add_column :profiles, :picture4_updated_at,   :datetime
  end

  def self.down
    remove_column :profiles, :picture1_file_name
    remove_column :profiles, :picture1_content_type
    remove_column :profiles, :picture1_file_size
    remove_column :profiles, :picture1_updated_at

    remove_column :profiles, :picture2_file_name
    remove_column :profiles, :picture2_content_type
    remove_column :profiles, :picture2_file_size
    remove_column :profiles, :picture2_updated_at

    remove_column :profiles, :picture3_file_name
    remove_column :profiles, :picture3_content_type
    remove_column :profiles, :picture3_file_size
    remove_column :profiles, :picture3_updated_at
  
    remove_column :profiles, :picture4_file_name
    remove_column :profiles, :picture4_content_type
    remove_column :profiles, :picture4_file_size
    remove_column :profiles, :picture4_updated_at
  end
end
