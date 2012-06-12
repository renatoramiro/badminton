class AddAttachmentPhotoToTecnico < ActiveRecord::Migration
  def change
  	add_column :tecnicos, :photo_file_name, :string
    add_column :tecnicos, :photo_content_type, :string
    add_column :tecnicos, :photo_file_size, :integer
    add_column :tecnicos, :photo_updated_at, :datetime
  end
end
