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

end
