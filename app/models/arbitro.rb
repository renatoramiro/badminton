class Arbitro < ActiveRecord::Base
  attr_accessible :ano_do_curso_de_arbitragem, :cpf, :cursos_de_arbitragem,
  								:data_de_nascimento, :email, :endereco_completo, :nome, :rg,
  								:telefone, :celular, :user_id

	belongs_to :user

	validates_presence_of :cpf, :rg, :data_de_nascimento, :nome, :celular, :ano_do_curso_de_arbitragem
	validates_uniqueness_of :cpf

	def self.paginar(param)
		paginate(:page => param, :per_page => 10)
	end

	def self.search(busca)
    where("nome ILIKE :termo OR celular ILIKE :termo OR cpf ILIKE :termo", :termo => "%#{busca}%")
  end
end
