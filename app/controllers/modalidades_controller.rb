class ModalidadesController < ApplicationController
  # GET /modalidades
  # GET /modalidades.json
  def index
    @modalidades = Modalidade.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @modalidades }
    end
  end

  # GET /modalidades/1
  # GET /modalidades/1.json
  def show
    @modalidade = Modalidade.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @modalidade }
    end
  end

  # GET /modalidades/new
  # GET /modalidades/new.json
  def new
    @modalidade = Modalidade.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @modalidade }
    end
  end

  # GET /modalidades/1/edit
  def edit
    @modalidade = Modalidade.find(params[:id])
  end

  # POST /modalidades
  # POST /modalidades.json
  def create
    @modalidade = Modalidade.new(params[:modalidade])

    respond_to do |format|
      if @modalidade.save
        format.html { redirect_to @modalidade, notice: 'Modalidade was successfully created.' }
        format.json { render json: @modalidade, status: :created, location: @modalidade }
      else
        format.html { render action: "new" }
        format.json { render json: @modalidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /modalidades/1
  # PUT /modalidades/1.json
  def update
    @modalidade = Modalidade.find(params[:id])

    respond_to do |format|
      if @modalidade.update_attributes(params[:modalidade])
        format.html { redirect_to @modalidade, notice: 'Modalidade was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @modalidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /modalidades/1
  # DELETE /modalidades/1.json
  def destroy
    @modalidade = Modalidade.find(params[:id])
    @modalidade.destroy

    respond_to do |format|
      format.html { redirect_to modalidades_url }
      format.json { head :no_content }
    end
  end
end
