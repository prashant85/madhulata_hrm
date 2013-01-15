class AddColumnEmployeeDetailIdToLeaveapplication < ActiveRecord::Migration
  def change
    add_column :leaveapplications, :employee_detail_id, :integer
  end
end
