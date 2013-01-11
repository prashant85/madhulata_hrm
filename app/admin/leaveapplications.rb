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
    
end
