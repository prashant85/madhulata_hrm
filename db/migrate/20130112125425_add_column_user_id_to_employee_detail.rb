class AddColumnUserIdToEmployeeDetail < ActiveRecord::Migration
  def change
    add_column :employee_details, :user_id, :integer
  end
end
