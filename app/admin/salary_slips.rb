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
 	column "Employee Name", :employee_detail
 	column :gross_salary
 	column :deduction
 	column :net_salary
 	default_actions
 end
end
