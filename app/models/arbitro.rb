class Arbitro < ActiveRecord::Base
  attr_accessible :ano_do_curso_de_arbitragem, :cpf, :cursos_de_arbitragem,
  								:data_de_nascimento, :email, :endereco_completo, :nome, :rg,
  								:telefone, :celular, :user_id

	belongs_to :user

	validates_presence_of :cpf, :rg, :data_de_nascimento, :nome, :celular, :ano_do_curso_de_arbitragem
	validates_uniqueness_of :cpf

	def self.search(busca)
    where("nome LIKE :termo OR celular LIKE :termo OR data_de_nascimento LIKE :termo", 
          :termo => "%#{busca}%")
  end
end
