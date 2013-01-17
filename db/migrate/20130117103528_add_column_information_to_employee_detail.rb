class AddColumnInformationToEmployeeDetail < ActiveRecord::Migration
  def change
    add_column :employee_details, :father_name, :string
    add_column :employee_details, :date_of_birth, :date
    add_column :employee_details, :email, :string
    add_column :employee_details, :blood_group, :string
  end
end
