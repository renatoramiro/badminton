#encoding: utf-8
ActiveAdmin.register User do
  menu :label => "Usuários"
  filter :email
  filter :created_at

  index do
    id_column
    column :email
    column "Criado em" do |user|
      user.created_at.strftime("%d de %B de %Y - %H:%M:%S")
    end
    default_actions
  end

  show :title => "Atletas" do
    panel "Lista de Atletas" do
      table_for(user.atletas) do
        column("Nome")                   {|atleta| label atleta.nome }
        column("Data de Nascimento")     {|atleta| label(atleta.data_de_nascimento.strftime("%d/%m/%Y")) }
        column("Criado em")              {|atleta| label(atleta.created_at.strftime("%d/%m/%Y")) }
        column "Possui foto?" do |atleta|
          if atleta.photo?
            status_tag("SIM")
          else
            status_tag("não")
          end
        end
      end
    end

    panel "Lista de Árbitros" do
      table_for(user.arbitros) do
        column("Nome")                   {|arbitro| label(arbitro.nome) }
        column("Data de Nascimento")     {|arbitro| label(arbitro.data_de_nascimento.strftime("%d/%m/%Y")) }
        column("Criado em")              {|arbitro| label(arbitro.created_at.strftime("%d/%m/%Y")) }
        column "Possui foto?" do |arbitro|
          if arbitro.photo?
            status_tag("SIM")
          else
            status_tag("NÃO")
          end
        end
      end
    end

    panel "Lista de Técnicos" do
      table_for(user.tecnicos) do
        column("Nome")                   {|tecnico| label(tecnico.nome) }
        column("Data de Nascimento")     {|tecnico| label(tecnico.data_de_nascimento.strftime("%d/%m/%Y")) }
        column("Criado em")              {|tecnico| label(tecnico.created_at.strftime("%d/%m/%Y")) }
        column "Possui foto?" do |tecnico|
          if tecnico.photo?
            status_tag("SIM")
          else
            status_tag("NÃO")
          end
        end
      end
    end
  end

  sidebar "Detalhes do Dono", :only => :show do
    attributes_table_for user, :email, :created_at
  end

#  sidebar "Order History", :only => :show do
#    attributes_table_for customer do
#      row("Total Orders") { customer.orders.complete.count }
#      row("Total Value") { number_to_currency customer.orders.complete.sum(:total_price) }
#    end
#  end
end
