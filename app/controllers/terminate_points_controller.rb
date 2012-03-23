class TerminatePointsController < ApplicationController
  layout 'vlansupmenu'

  # GET /terminate_points
  # GET /terminate_points.json
  def index
    @terminate_points = TerminatePoint.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @terminate_points }
    end
  end

  # GET /terminate_points/1
  # GET /terminate_points/1.json
# def show
#   @terminate_point = TerminatePoint.find(params[:id])
#
#   respond_to do |format|
#     format.html # show.html.erb
#     format.json { render json: @terminate_point }
#   end
# end

  # GET /terminate_points/new
  # GET /terminate_points/new.json
  def new
    @terminate_point = TerminatePoint.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @terminate_point }
    end
  end

  # GET /terminate_points/1/edit
  def edit
    @terminate_point = TerminatePoint.find(params[:id])
  end

  # POST /terminate_points
  # POST /terminate_points.json
  def create
    @terminate_point = TerminatePoint.new(params[:terminate_point])

    respond_to do |format|
      if @terminate_point.save
        format.html { redirect_to terminate_points_path, notice: 'Terminate point was successfully created.' }
        format.json { render json: @terminate_point, status: :created, location: @terminate_point }
      else
        format.html { render action: "new" }
        format.json { render json: @terminate_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /terminate_points/1
  # PUT /terminate_points/1.json
  def update
    @terminate_point = TerminatePoint.find(params[:id])

    respond_to do |format|
      if @terminate_point.update_attributes(params[:terminate_point])
        format.html { redirect_to :back, notice: 'Terminate point was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @terminate_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /terminate_points/1
  # DELETE /terminate_points/1.json
  def destroy
    @terminate_point = TerminatePoint.find(params[:id])

    if @terminate_point.vlans==[] and @terminate_point.vinos==[]
      @terminate_point.destroy
      redirect_to terminate_points_path, notice: 'Terminate point del succefull' 
    else
      redirect_to terminate_points_path, error: "Can't remove Terminate point, pls del vlans and vinoses linked with this terminate point"
    end
  end
end
