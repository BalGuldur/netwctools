class MyusersController < ApplicationController
  # GET /myusers
  # GET /myusers.json
  def index
    @myusers = Myuser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @myusers }
    end
  end

  # GET /myusers/1
  # GET /myusers/1.json
  def show
    @myuser = Myuser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @myuser }
    end
  end

  # GET /myusers/new
  # GET /myusers/new.json
  def new
    @myuser = Myuser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @myuser }
    end
  end

  # GET /myusers/1/edit
  def edit
    @myuser = Myuser.find(params[:id])
  end

  # POST /myusers
  # POST /myusers.json
  def create
    @myuser = Myuser.new(params[:myuser])

    respond_to do |format|
      if @myuser.save
        format.html { redirect_to vlans_path, notice: 'Myuser was successfully created.' }
        format.json { render json: @myuser, status: :created, location: @myuser }
      else
        format.html { render action: "new" }
        format.json { render json: @myuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /myusers/1
  # PUT /myusers/1.json
  def update
    @myuser = Myuser.find(params[:id])

    respond_to do |format|
      if @myuser.update_attributes(params[:myuser])
        format.html { redirect_to @myuser, notice: 'Myuser was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @myuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /myusers/1
  # DELETE /myusers/1.json
  def destroy
    @myuser = Myuser.find(params[:id])
		respond_to do |format|
			if @myuser.domains.empty?
				@myuser.destroy
				format.html {redirect_to :back, notice: "User deleted" }
				format.json {head :ok}
			else
				format.html {redirect_to :back, alert: "Can't delete, try del all domains for this user"}
				format.json {render json: @myuser.errors, status: :unprocessable_entity }
			end
		end

  end
end
