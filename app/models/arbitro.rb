class Arbitro < ActiveRecord::Base
  attr_accessible :ano_do_curso_de_arbitragem, :cpf, :cursos_de_arbitragem,
  								:data_de_nascimento, :email, :endereco_completo, :nome, :rg,
  								:telefone, :celular, :user_id

	belongs_to :user

	def self.search(busca)
    where("nome LIKE :termo OR celular LIKE :termo OR data_de_nascimento LIKE :termo", 
          :termo => "%#{busca}%")
  end
end
