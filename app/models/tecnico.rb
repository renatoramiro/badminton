class Tecnico < ActiveRecord::Base
  attr_accessible :celular, :cpf, :cref,
  								:data_de_nascimento, :email,
  								:endereco_completo, :intituicao_de_ensino,
  								:nome, :rg, :telefone, :user_id

	belongs_to :user

  validates_presence_of :cpf, :rg, :nome, :data_de_nascimento, :celular, :cref
  validates_uniqueness_of :cpf, :cref

  def self.paginar(param)
    paginate(:page => param, :per_page => 10)
  end

	def self.search(busca)
    where("nome ILIKE :termo OR intituicao_de_ensino ILIKE :termo OR cref ILIKE :termo
    			OR email ILIKE :termo", 
          :termo => "%#{busca}%")
  end
end
