class AddColumnEmployeeDetailIdToSalarySlip < ActiveRecord::Migration
  def change
    add_column :salary_slips, :employee_detail_id, :integer
  end
end
