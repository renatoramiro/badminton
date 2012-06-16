# encoding: utf-8
ActiveAdmin.register Tecnico do
  menu :label => "Técnicos"
	filter :nome
	filter :celular
	filter :email
	filter :data_de_nascimento
  filter :cpf

  index do
  	column :nome
  	column "Data de Nascimento" do |tecnico|
  		tecnico.data_de_nascimento.strftime("%d/%m/%Y")
  	end
  	column "CPF", :cpf
  	column :celular
  	column :email
  	column "Criador" do |tecnico|
  		tecnico.user.email
  	end
  end
end
