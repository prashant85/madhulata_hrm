ActiveAdmin.register Leaveapplication do
  form do |f|
	f.inputs do
		f.input :name
		f.input :description, :label => "Emergency_contact_details"
		f.input :subject, :label =>"Reason"
		f.inputs do
	       f.input :from ,:as=> :date
	       f.input :to, :as=> :date
	     end  
	    f.input :comment, :label => "Status" ,:collection => ["Pending", "Accepted", "Rejected","Revoked"], :default => "pending"
        f.input :leavetype
        f.input :commentonleave, :label => "Comment"
     end
        f.buttons "Submit"
   end
    index do 
		column "S.No",:id
		column :name
		column "Employee Id",:employee_detail,:sortable => :employee_detail do |r|
 		  r.employee_detail.sub_unit
 		end
		# column :subject, :label => "Reason"
		column :from, :sortable => :from do |r|
			r.from.strftime("%d/%m/%Y")
		end
		column :to, :sortable => :to do |r|
			r.to.strftime("%d/%m/%Y")
		end
		column "Status"	,:comment 	
		column "Leave Type",:leavetype
        # column :total_leave
		# column "Comment", :commentonleave
        default_actions	
	 end

	 show :title => :name do
	 	attributes_table do	
	 		row :name
	 		row :from
	 		row :to 
	 		row :leavetype 

	 	 end
	 end	


 controller do
	 def update
	 	@leaveapplication = Leaveapplication.find(params[:id])       
      respond_to do |format|
        if @leaveapplication.update_attributes(params[:leaveapplication])
          Notifier.response_request(@leaveapplication).deliver   
          format.html { redirect_to admin_leaveapplications_path notice: 'Leaveapplication was successfully updated.' }
          format.json { head :no_content }
        
        end
      end
    end
  end

end
