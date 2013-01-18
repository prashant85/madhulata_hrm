class AddColumnPhoneNumberToEmployeeDetail < ActiveRecord::Migration
  def change
    add_column :employee_details, :phone_number, :string
  end
end
