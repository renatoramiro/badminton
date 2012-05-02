class Atleta < ActiveRecord::Base
  attr_accessible :categoria, :codigo, :cpf,
  								:data_de_nascimento, :email,
  								:endereco, :entidade_filiada,
  								:nome, :nome_da_mae, :nome_do_pai,
  								:ranking, :rg, :modalidade_ids,
  								:celular, :telefone,
  								:user_id
  								
	has_and_belongs_to_many :modalidades

	belongs_to :user

  validates_presence_of :codigo, :nome, :cpf, :rg,
                        :data_de_nascimento, :email,
                        :nome_da_mae, :celular, :telefone

  validates_uniqueness_of :cpf, :email

  def self.search(busca)
    where("nome LIKE :termo OR nome_da_mae LIKE :termo OR nome_do_pai LIKE :termo OR codigo LIKE :termo", 
          :termo => "%#{busca}%")
  end
end
