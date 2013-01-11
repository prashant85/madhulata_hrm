class LastJobDetail < ActiveRecord::Base
  attr_accessible :company, :employee_detail_id, :end_date, :job_description, :start_date
  belongs_to :employee_detail
  
end
