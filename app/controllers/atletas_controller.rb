# encoding: utf-8
class AtletasController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_resouces, :only => %w(new create edit update)
  load_and_authorize_resource

  # GET /atletas
  # GET /atletas.json
  def index

    @atletas = current_user.atletas.scoped
    @atletas = @atletas.search(params[:search]) if params[:search].present?
    @atletas = @atletas.paginar(params[:page]).order(:nome)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @atletas }
      format.xls do
        render :xls => @atletas,
                       :columns => [ :nome, :data_de_nascimento, :nome_do_pai, :nome_da_mae, :rg, :cpf, :email, :telefone, :celular,
                                    :rua, :numero, :complemento, :bairro, :cidade, :estado, :cep,
                                    :codigo, :entidade_filiada, :ranking, :categoria ],
                       :headers => %w[ Nome Data\ de\ Nascimento Nome\ do\ Pai Nome\ da\ Mãe RG CPF Email Telefone Celular 
                                      Rua Número Complemento Bairro Cidade Estado CEP
                                      Código Entidade\ Filiada Ranking Categoria ]
      end
    end
  end

  # GET /atletas/1
  # GET /atletas/1.json
  def show
    @atleta = Atleta.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @atleta }
    end
  end

  # GET /atletas/new
  # GET /atletas/new.json
  def new
    @atleta = current_user.atletas.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @atleta }
    end
  end

  # GET /atletas/1/edit
  def edit
    @atleta = Atleta.find(params[:id])
  end

  # POST /atletas
  # POST /atletas.json
  def create
    @atleta = Atleta.new(params[:atleta])
    @atleta.user = current_user

    respond_to do |format|
      if @atleta.save
        format.html { redirect_to @atleta, notice: 'Atleta foi criado com sucesso.' }
        format.json { render json: @atleta, status: :created, location: @atleta }
      else
        format.html { render action: "new" }
        format.json { render json: @atleta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /atletas/1
  # PUT /atletas/1.json
  def update
    @atleta = Atleta.find(params[:id])
    @atleta.user = current_user

    respond_to do |format|
      if @atleta.update_attributes(params[:atleta])
        format.html { redirect_to @atleta, notice: 'Atleta foi atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @atleta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atletas/1
  # DELETE /atletas/1.json
  def destroy
    @atleta = Atleta.find(params[:id])
    @atleta.destroy

    respond_to do |format|
      format.html { redirect_to atletas_url }
      format.json { head :no_content }
    end
  end

protected
  def load_resouces
    @modalidades = Modalidade.all
    @categorias = %w{SUB-10 SUB-11 SUB-13 SUB-15 SUB-17 SUB-19 Principal Sênior Veterano}
  end

end
