ActiveAdmin.register Leaveapplication do
  form do |f|
	f.inputs do
		f.input :name
		f.input :description
		f.input :subject
	    f.input :from
	    f.input :to
	    f.input :comment, :label => "Status" ,:collection => ["Pending", "Accepted", "Rejected"], :default => "pending"
  
     end
        f.buttons "Submit"
   end
    index do
		column :id
		column :name
		column :subject
		column :from
		column :to
		column :comment, :label => "Status"		
        default_actions	
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
