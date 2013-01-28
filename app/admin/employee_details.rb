ActiveAdmin.register EmployeeDetail do                                                                                                                                           ActiveAdmin.register EmployeeDetail do
actions :all
	form do |f|

		f.inputs "Personal Information" do
			f.input :name
			f.input :father_name
			f.input :date_of_birth, :start_year => Time.now.year - 100, :end_year => Time.now.year + 100, :as => :date 
			f.input :email
			 f.input :phone_number, :label => "Contact No."
			f.input :local_address, :label => "Correspondence Address"
			f.input :permanent_address
			f.input :blood_group
			f.input :account_no
		end
		f.inputs "Job Details" do
		   f.input :job_title
		   f.input :sub_unit , :label => "Employee ID", :uniqueness => true
		   f.input :job_specification
		   f.input :location	
		   f.input :employement_status, :as=> :select, :include_blank=> true ,:collection => ["Confirm", "trainee", "Consultant", "Other" ]
		   f.input :join_date, :as => :date
		   f.input :confirmation_date, :as => :date	
		end
		f.inputs "Image" do
		  f.has_many :photos do |p|
              p.input :image, :as => :file , :hint => p.template.image_tag(p.object.image.url(:thumb))
              p.input :_destroy, :as=>:boolean, :required => false, :label => 'Remove image'
           end 
        end
        f.inputs "Previous Employment Status" do
        	f.has_many :last_job_details do |p|
        		p.input :company
        		p.input :job_description, :label => "Designation"
        		p.input :start_date, :as => :date
        		p.input :end_date, :as => :date        		
        	end
        end
       	  f.inputs do
		    f.input :contract_detail, :label => "Contract Details" 
		  end
	    f.buttons "submit"
	end	
   index do
    column "S.No", :id
		column :name
    column "Employee Id",:sub_unit
		column :date_of_birth
		column :father_name
		column :email
	    column :phone_number
		column :join_date
		column :permanent_address
		column :local_address
		column :employement_status		
        default_actions	
	 end
    
     sidebar :help do
       ul do
         li "First Line of Help"
       end
     end
   show  :title => :name do 
		attributes_table do			
			row :photos do |p|
              begin
                image_tag p.photos.first.image.url(:thumb)
              rescue => e
              end  
            end
            row :phone_number
            row :father_name
            row :date_of_birth
            row :blood_group
            row :account_no
            row :permanent_address
            row :local_address
            row :location
            row :employement_status
            row :join_date
            row :job_title
            row :confirmation_date
           
		end
	end
 end

  controller do
   def update
 	 	  @employee_detail = EmployeeDetail.find(params[:id])
 	 	  respond_to do |format|
           if @employee_detail.update_attributes(params[:employee_detail])
             Notifier.acceptence_info(@employee_detail).deliver   
             format.html { redirect_to admin_employee_details_path }
             format.json { head :no_content }
        
           end
      end
   end

    def destroy
       @employee_detail = EmployeeDetail.find(params[:id])
       @user = User.find(@employee_detail.id)
       @leaveapplications = Leaveapplication.find(@employee_detail.id)
       @salaryslips = SalarySlip.find(@employee_detail.id)
       @employee_detail.destroy
       @user.destroy
       @salaryslips.destroy
       @leaveapplications.destroy
            respond_to do |format|
                   format.html { redirect_to admin_employee_details_path }
                  format.json { head :no_content }
            end
    end
  end
end
