# encoding: utf-8
class RelatorioController < ApplicationController
  def atleta
  	@atleta = Atleta.find(params[:id])
  	unless current_user.atletas.include?(@atleta)
  		redirect_to "/denied.html", notice: "Não foi possível exibir detalhes do atleta."
  	end
  end

  def arbitro
  	@arbitro = Arbitro.find(params[:id])
  	unless current_user.arbitros.include?(@arbitro)
  		redirect_to "/denied.html", notice: "Não foi possível exibir detalhes do árbitro."
  	end
  end

  def tecnico
  	@tecnico = Tecnico.find(params[:id])
  	unless current_user.tecnicos.include?(@tecnico)
  		redirect_to "/denied.html", notice: "Não foi possível exibir detalhes do técnico."
  	end
  end

  def arbitros
    @arbitros = current_user.arbitros
  end

  def atletas
    @atletas = current_user.atletas
  end

  def tecnicos
    @tecnicos = current_user.tecnicos
  end
end
