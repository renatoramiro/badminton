class Tecnico < ActiveRecord::Base
  attr_accessible :celular, :cpf, :cref,
  								:data_de_nascimento, :email,
  								:endereco_completo, :intituicao_de_ensino,
  								:nome, :rg, :telefone, :user_id

	belongs_to :user

  validates_presence_of :cpf, :rg, :nome, :data_de_nascimento, :celular, :cref
  validates_uniqueness_of :cpf, :cref

	def self.search(busca)
    where("nome LIKE :termo OR intituicao_de_ensino LIKE :termo OR data_de_nascimento LIKE :termo OR cref LIKE :termo
    			OR email LIKE :termo", 
          :termo => "%#{busca}%")
  end
end
