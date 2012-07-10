# encoding: utf-8
class TecnicosController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /tecnicos
  # GET /tecnicos.json
  def index
    @tecnicos = current_user.tecnicos.scoped
    @tecnicos = @tecnicos.search(params[:search]) if params[:search].present?
    @tecnicos = @tecnicos.paginar(params[:page]).order(:nome)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tecnicos }
      format.xls do
        render :xls => @tecnicos,
                       :columns => [ :nome, :data_de_nascimento, :rg, :cpf, :email, :telefone, :celular,
                                    :rua, :numero, :complemento, :bairro, :cidade, :estado, :cep,
                                    :intituicao_de_ensino, :cref ],
                       :headers => %w[ Nome Data\ de\ Nascimento RG CPF Email Telefone Celular Rua Número Complemento
                                      Bairro Cidade Estado CEP Instituicao\ de\ Ensino CREF ]
      end
    end
  end

  # GET /tecnicos/1
  # GET /tecnicos/1.json
  def show
    @tecnico = Tecnico.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tecnico }
    end
  end

  # GET /tecnicos/new
  # GET /tecnicos/new.json
  def new
    @tecnico = current_user.tecnicos.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tecnico }
    end
  end

  # GET /tecnicos/1/edit
  def edit
    @tecnico = Tecnico.find(params[:id])
  end

  # POST /tecnicos
  # POST /tecnicos.json
  def create
    @tecnico = Tecnico.new(params[:tecnico])
    @tecnico.user = current_user

    respond_to do |format|
      if @tecnico.save
        format.html { redirect_to @tecnico, notice: 'Técnico foi criado com sucesso.' }
        format.json { render json: @tecnico, status: :created, location: @tecnico }
      else
        format.html { render action: "new" }
        format.json { render json: @tecnico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tecnicos/1
  # PUT /tecnicos/1.json
  def update
    @tecnico = Tecnico.find(params[:id])
    @tecnico.user = current_user

    respond_to do |format|
      if @tecnico.update_attributes(params[:tecnico])
        format.html { redirect_to @tecnico, notice: 'Técnico foi atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tecnico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tecnicos/1
  # DELETE /tecnicos/1.json
  def destroy
    @tecnico = Tecnico.find(params[:id])
    @tecnico.destroy

    respond_to do |format|
      format.html { redirect_to tecnicos_url }
      format.json { head :no_content }
    end
  end
end
