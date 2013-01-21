class RemoveColumnEmployeeDetailIdToSalarySlip < ActiveRecord::Migration
  def up
    remove_column :salary_slips, :employtee_detail_id
  end

  def down
    add_column :salary_slips, :employtee_detail_id, :integer
  end
end
