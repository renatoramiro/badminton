class Tecnico < ActiveRecord::Base
  attr_accessible :celular, :cpf, :cref,
  								:data_de_nascimento, :email,
  								:endereco_completo, :intituicao_de_ensino,
  								:nome, :rg, :telefone, :user_id

	belongs_to :user

	def self.search(busca)
    where("nome LIKE :termo OR intituicao_de_ensino LIKE :termo OR data_de_nascimento LIKE :termo OR cref LIKE :termo
    			OR email LIKE :termo", 
          :termo => "%#{busca}%")
  end
end
