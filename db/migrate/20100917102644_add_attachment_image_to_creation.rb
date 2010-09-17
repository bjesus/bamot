class AddAttachmentImageToCreation < ActiveRecord::Migration
  def self.up
    add_column :creations, :image_file_name, :string
    add_column :creations, :image_content_type, :string
    add_column :creations, :image_file_size, :integer
    add_column :creations, :image_updated_at, :datetime
  end

  def self.down
    remove_column :creations, :image_file_name
    remove_column :creations, :image_content_type
    remove_column :creations, :image_file_size
    remove_column :creations, :image_updated_at
  end
end
