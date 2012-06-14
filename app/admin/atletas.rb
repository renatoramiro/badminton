# encoding: utf-8
ActiveAdmin.register Atleta do
	menu :label => "Atletas"
	filter :nome
	filter :celular
	filter :nome_da_mae
	filter :data_de_nascimento

  index do
  	column :nome
  	column "Data de Nascimento" do |atleta|
  		atleta.data_de_nascimento.strftime("%d/%m/%Y")
  	end
  	column "CPF", :cpf
  	column :celular
  	column "Nome da mãe", :nome_da_mae
  	column "Criador" do |atleta|
  		atleta.user.email
  	end
  end
end
