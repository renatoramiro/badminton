class Atleta < ActiveRecord::Base
  attr_accessible :categoria, :codigo, :cpf,
  								:data_de_nascimento, :email,
  								:endereco, :entidade_filiada,
  								:nome, :nome_da_mae, :nome_do_pai,
  								:ranking, :rg, :modalidade_ids,
  								:celular, :telefone,
  								:user_id, :photo, :image_delete
  								
	has_and_belongs_to_many :modalidades

	belongs_to :user

  validates_presence_of :codigo, :nome, :cpf, :rg,
                        :data_de_nascimento, :email,
                        :nome_da_mae, :celular, :telefone

  validates_uniqueness_of :cpf, :email

  has_attached_file :photo,
                    :storage => :s3, :s3_credentials => S3_CREDENTIALS,
                    :path => "/system/:class/:id/:style/:basename.:extension"

  validates_attachment_size :photo, :in => 0..300.kilobytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']                    

  def self.paginar(param)
    paginate(:page => param, :per_page => 10)
  end

  def self.search(busca)
    where("nome ILIKE :termo OR nome_da_mae ILIKE :termo OR nome_do_pai ILIKE :termo OR codigo ILIKE :termo", 
          :termo => "%#{busca}%")
  end

  before_save :destroy_image?

  def image_delete
    @image_delete ||= "0"
  end

  def image_delete=(value)
    @image_delete = value
  end

private
  def destroy_image?
    self.photo.clear if @image_delete == "1"
  end
end
