class AddColumnAccountNoToEmployeeDetail < ActiveRecord::Migration
  def change
    add_column :employee_details, :account_no, :string
  end
end
