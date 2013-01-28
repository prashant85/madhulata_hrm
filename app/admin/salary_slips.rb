ActiveAdmin.register SalarySlip do
  form do |f|
  	 f.inputs do
  	  f.input :selecttime 
  	  f.input :employee_detail
  	  f.input :gross_salary
  	  f.input :deduction 	  	  
  	end
  	f.buttons "Submit"
  end

 index do
 	column "S.No",:id
  column "Employee Name", :employee_detail
 	# column "Employee Id",:employee_detail, :sortable => :employee_detail do |r|
 	# 	r.employee_detail.sub_unit
 	# end
 	column :gross_salary
 	column :deduction
 	column :net_salary
 	column "Select Time",:selecttime, :sortable => :selecttime do |r|
			r.selecttime.strftime("%B/%Y")
		end
 	default_actions
 end
end
