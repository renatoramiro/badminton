class TecnicosController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /tecnicos
  # GET /tecnicos.json
  def index
    @tecnicos = current_user.tecnicos.scoped
    @tecnicos = @tecnicos.search(params[:search]) if params[:search].present?
    @tecnicos = @tecnicos.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tecnicos }
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
        format.html { redirect_to @tecnico, notice: 'Tecnico was successfully created.' }
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
        format.html { redirect_to @tecnico, notice: 'Tecnico was successfully updated.' }
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
