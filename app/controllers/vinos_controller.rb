class VinosController < ApplicationController
  # GET /vinos
  # GET /vinos.json
  def index
    @vinos = Vino.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vinos }
    end
  end

  # GET /vinos/1
  # GET /vinos/1.json
  def show
    @vino = Vino.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vino }
    end
  end

  # GET /vinos/new
  # GET /vinos/new.json
  def new
    @vino = Vino.new
		@terminate_points=TerminatePoint.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vino }
    end
  end

  # GET /vinos/1/edit
  def edit
    @vino = Vino.find(params[:id])
  end

  # POST /vinos
  # POST /vinos.json
  def create
    @vino = Vino.new(params[:vino])

    respond_to do |format|
      if @vino.save
				@terminatepoint=TerminatePoint.find(params[:vino][:terminate_point_id])
				@terminatepoint.vinos << @vino
        format.html { redirect_to @vino, notice: 'Vino was successfully created.' }
        format.json { render json: @vino, status: :created, location: @vino }
      else
        format.html { render action: "new" }
        format.json { render json: @vino.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vinos/1
  # PUT /vinos/1.json
  def update
    @vino = Vino.find(params[:id])

    respond_to do |format|
      if @vino.update_attributes(params[:vino])
        format.html { redirect_to @vino, notice: 'Vino was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @vino.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vinos/1
  # DELETE /vinos/1.json
  def destroy
    @vino = Vino.find(params[:id])
    @vino.destroy

    respond_to do |format|
      format.html { redirect_to vinos_url }
      format.json { head :ok }
    end
  end
end
