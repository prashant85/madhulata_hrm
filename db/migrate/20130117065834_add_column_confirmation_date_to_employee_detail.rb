class AddColumnConfirmationDateToEmployeeDetail < ActiveRecord::Migration
  def change
    add_column :employee_details, :confirmation_date, :date
  end
end
