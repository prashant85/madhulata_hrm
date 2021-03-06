class SalarySlipsController < ApplicationController
  before_filter :authenticate_user!
  # GET /salary_slips
  # GET /salary_slips.json
  def index
    @salary_slips = SalarySlip.where(:employee_detail_id => current_user.id)
    #@salary_slips = SalarySlip.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @salary_slips }
    end
  end

  # GET /salary_slips/1
  # GET /salary_slips/1.json
  def show
    @salary_slip = SalarySlip.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      # format.pdf { render :text => PDFKit.new( salary_slip_path(@salary_slip) ).to_pdf }
      format.pdf do 
        render :pdf => "show.html.erb"
      end
    end 
  end

  # GET /salary_slips/new
  # GET /salary_slips/new.json
  def new
    @salary_slip = SalarySlip.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @salary_slip }
    end
  end

  # GET /salary_slips/1/edit
  def edit
    @salary_slip = SalarySlip.find(params[:id])
  end

  # POST /salary_slips
  # POST /salary_slips.json
  def create
    @salary_slip = SalarySlip.new(params[:salary_slip])

    respond_to do |format|
      if @salary_slip.save
        format.html { redirect_to @salary_slip, notice: 'Salary slip was successfully created.' }
        format.json { render json: @salary_slip, status: :created, location: @salary_slip }               
      else
        format.html { render action: "new" }
        format.json { render json: @salary_slip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /salary_slips/1
  # PUT /salary_slips/1.json
  def update
    @salary_slip = SalarySlip.find(params[:id])

    respond_to do |format|
      if @salary_slip.update_attributes(params[:salary_slip])
        format.html { redirect_to @salary_slip, notice: 'Salary slip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @salary_slip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salary_slips/1
  # DELETE /salary_slips/1.json
  def destroy
    @salary_slip = SalarySlip.find(params[:id])
    @salary_slip.destroy

    respond_to do |format|
      format.html { redirect_to salary_slips_url }
      format.json { head :no_content }
    end
  end
  
end
