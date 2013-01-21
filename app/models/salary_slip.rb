class SalarySlip < ActiveRecord::Base
  attr_accessible :deduction, :employee_detail_id, :gross_salary, :net_salary, :selecttime
  belongs_to :employee_detail
  before_save :total_salary

  def total_salary
  	self.net_salary = self.gross_salary.to_i - self.deduction.to_i
  end
end
