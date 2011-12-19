class OutinsController < ApplicationController
  # GET /outins
  # GET /outins.json
  def index
    @outins = Outin.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @outins }
    end
  end

  # GET /outins/1
  # GET /outins/1.json
  def show
    @outin = Outin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @outin }
    end
  end

  # GET /outins/new
  # GET /outins/new.json
  def new
    @outin = Outin.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @outin }
    end
  end

  # GET /outins/1/edit
  def edit
    @outin = Outin.find(params[:id])
  end

  # POST /outins
  # POST /outins.json
  def create
    @outin = Outin.new(params[:outin])

    respond_to do |format|
      if @outin.save
        format.html { redirect_to @outin, notice: 'Outin was successfully created.' }
        format.json { render json: @outin, status: :created, location: @outin }
      else
        format.html { render action: "new" }
        format.json { render json: @outin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /outins/1
  # PUT /outins/1.json
  def update
    @outin = Outin.find(params[:id])

    respond_to do |format|
      if @outin.update_attributes(params[:outin])
        format.html { redirect_to @outin, notice: 'Outin was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @outin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outins/1
  # DELETE /outins/1.json
  def destroy
    @outin = Outin.find(params[:id])
    @outin.destroy

    respond_to do |format|
      format.html { redirect_to outins_url }
      format.json { head :ok }
    end
  end
end
