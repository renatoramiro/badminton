class AddAttachmentPhotoToArbitro < ActiveRecord::Migration
  def change
  	add_column :arbitros, :photo_file_name, :string
    add_column :arbitros, :photo_content_type, :string
    add_column :arbitros, :photo_file_size, :integer
    add_column :arbitros, :photo_updated_at, :datetime
  end
end
