class AddAttachmentPhotoToAtleta < ActiveRecord::Migration
  def change
  	add_column :atletas, :photo_file_name, :string
    add_column :atletas, :photo_content_type, :string
    add_column :atletas, :photo_file_size, :integer
    add_column :atletas, :photo_updated_at, :datetime
  end
end
