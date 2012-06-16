class Arbitro < ActiveRecord::Base
  attr_accessible :ano_do_curso_de_arbitragem, :cpf, :cursos_de_arbitragem,
  								:data_de_nascimento, :email, :nome, :rg,
  								:telefone, :celular, :user_id, :photo, :image_delete,
                  :rua, :numero, :bairro, :cidade, :estado, :cep

	belongs_to :user

	validates_presence_of :cpf, :rg, :data_de_nascimento, :nome, :celular, :ano_do_curso_de_arbitragem
	validates_uniqueness_of :cpf
  validates_numericality_of :numero, :greater_than => 0, :message => "deve ser maior que zero."

	has_attached_file :photo,
                    :storage => :s3, :s3_credentials => S3_CREDENTIALS,
                    :path => "/system/:class/:id/:style/:basename.:extension"

  validates_attachment_size :photo, :in => 0..100.kilobytes, :message => "deve ser menor do que 100KB"
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

	def self.paginar(param)
		paginate(:page => param, :per_page => 10)
	end

	def self.search(busca)
    where("nome ILIKE :termo OR celular ILIKE :termo OR cpf ILIKE :termo", :termo => "%#{busca}%")
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
