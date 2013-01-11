ActiveAdmin.register EmployeeDetail do
	actions :all
	form do |f|
		f.inputs "Personal Information" do
			f.input :name
			f.input :permanent_address
			f.input :local_address
			f.input :phone_no
			f.input :location			
			f.input :category, :as=> :select, :include_blank => true, :collection => ["gen", "freedomFighter", "Handicap", "special"]
		end
		f.inputs "Job Details" do
		   f.input :job_title
		   f.input :job_specification
		   f.input :employement_status, :as=> :select, :include_blank=> true ,:collection => ["Permanent", "trainee", "developer", "tester", "admin", "HR", "designer" ]
		   #f.input :sub_unit, :as => :select , :include_blank => true, :collection => ["admin", "employee"]
		   f.input :join_date
		end
		f.inputs "Image" do
		  f.has_many :photos do |p|
              p.input :image, :as => :file , :hint => p.template.image_tag(p.object.image.url(:thumb))
              p.input :_destroy, :as=>:boolean, :required => false, :label => 'Remove image'
           end 
        end
        f.inputs "Previous Job Details" do
        	f.has_many :last_job_details do |p|
        		p.input :company
        		p.input :start_date
        		p.input :end_date
        		p.input :job_description
        	end
        end		
		f.inputs "Contract Details" do
		   f.input :contract_detail 
	    end 
	    f.buttons "submit"
	end	
   index do
		column :id
		column :name
		column :phone_no
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
            row :phone_no
            row :permanent_address
            row :local_address
            row :location
            row :employement_status
            row :join_date
            row :job_title
           
		end
	end
end