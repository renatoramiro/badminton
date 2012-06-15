# encoding: utf-8
ActiveAdmin.register Arbitro do
  menu :label => "Árbitros"
	filter :nome
	filter :celular
	filter :email
	filter :data_de_nascimento
  fiter "CPF", :cpf

  index do
  	column :nome
  	column "Data de Nascimento" do |arbitro|
  		arbitro.data_de_nascimento.strftime("%d/%m/%Y")
  	end
  	column "CPF", :cpf
  	column :celular
  	column :email
  	column "Criador" do |arbitro|
  		arbitro.user.email
  	end
  end
end
