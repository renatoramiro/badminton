# encoding: utf-8
class ArbitrosController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /arbitros
  # GET /arbitros.json
  def index
    @arbitros = current_user.arbitros.scoped
    @arbitros = @arbitros.search(params[:search]) if params[:search].present?
    @arbitros = @arbitros.paginar(params[:page]).order(:nome)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @arbitros }
    end
  end

  # GET /arbitros/1
  # GET /arbitros/1.json
  def show
    @arbitro = Arbitro.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @arbitro }
    end
  end

  # GET /arbitros/new
  # GET /arbitros/new.json
  def new
    @arbitro = current_user.arbitros.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @arbitro }
    end
  end

  # GET /arbitros/1/edit
  def edit
    @arbitro = Arbitro.find(params[:id])
  end

  # POST /arbitros
  # POST /arbitros.json
  def create
    @arbitro = Arbitro.new(params[:arbitro])
    @arbitro.user = current_user

    respond_to do |format|
      if @arbitro.save
        format.html { redirect_to @arbitro, notice: 'Árbitro foi criado com sucesso.' }
        format.json { render json: @arbitro, status: :created, location: @arbitro }
      else
        format.html { render action: "new" }
        format.json { render json: @arbitro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /arbitros/1
  # PUT /arbitros/1.json
  def update
    @arbitro = Arbitro.find(params[:id])
    @arbitro.user = current_user

    respond_to do |format|
      if @arbitro.update_attributes(params[:arbitro])
        format.html { redirect_to @arbitro, notice: 'Árbitro foi atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @arbitro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /arbitros/1
  # DELETE /arbitros/1.json
  def destroy
    @arbitro = Arbitro.find(params[:id])
    @arbitro.destroy

    respond_to do |format|
      format.html { redirect_to arbitros_url }
      format.json { head :no_content }
    end
  end
end
