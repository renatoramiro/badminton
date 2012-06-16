class AddAttachmentLogotipoToUser < ActiveRecord::Migration
  def change
  	add_column :users, :logotipo_file_name,    :string
    add_column :users, :logotipo_content_type, :string
    add_column :users, :logotipo_file_size,    :integer
    add_column :users, :logotipo_updated_at,   :datetime
  end
end
