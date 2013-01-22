class LeaveapplicationsController < ApplicationController
  before_filter :authenticate_user!
  # GET /leaveapplications
  # GET /leaveapplications.json
  def index
    @leaveapplications = Leaveapplication.where(:user_id => current_user.id)
    @leaveapplication = Leaveapplication.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @leaveapplications }
    end
  end

  # GET /leaveapplications/1
  # GET /leaveapplications/1.json
  def show
    @leaveapplication = Leaveapplication.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @leaveapplication }
    end
  end

  # GET /leaveapplications/new
  # GET /leaveapplications/new.json
  def new
    @leaveapplication = Leaveapplication.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @leaveapplication }
    end
  end

  # GET /leaveapplications/1/edit
  def edit
    @leaveapplication = Leaveapplication.find(params[:id])
  end

  # POST /leaveapplications
  # POST /leaveapplications.json
  def create
    @leaveapplication = Leaveapplication.new(params[:leaveapplication])
    @leaveapplication.name = current_user.name
    @leaveapplication.user_id = current_user.id
    @leaveapplication.employee_detail_id = current_user.id
    @leaveapplication.comment = "Pending"
    respond_to do |format|
      if @leaveapplication.save
        Notifier.sending_request(@leaveapplication).deliver
        format.html { redirect_to leaveapplications_path, notice: 'Leaveapplication was successfully created.' }
        format.json { render json: @leaveapplication, status: :created, location: @leaveapplication }
      else
        format.html { render action: "new" }
        format.json { render json: @leaveapplication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /leaveapplications/1
  # PUT /leaveapplications/1.json
  def update
    @leaveapplication = Leaveapplication.find(params[:id])

    respond_to do |format|
      if @leaveapplication.update_attributes(params[:leaveapplication])
        format.html { redirect_to @leaveapplication, notice: 'Leaveapplication was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @leaveapplication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leaveapplications/1
  # DELETE /leaveapplications/1.json
  def destroy
    @leaveapplication = Leaveapplication.find(params[:id])
    @leaveapplication.destroy

    respond_to do |format|
      format.html { redirect_to leaveapplications_url }
      format.json { head :no_content }
    end
  end
  
  
end
