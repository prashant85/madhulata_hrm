class CreateEmployeeDetails < ActiveRecord::Migration
  def change
    create_table :employee_details do |t|
      t.string :name
      t.string :permanent_address
      t.string :local_address
      t.integer :phone_no
      t.datetime :join_date
      t.string :category
      t.string :contract_detail
      t.string :job_title
      t.string :job_specification
      t.string :employement_status
      t.string :sub_unit
      t.string :location

      t.timestamps
    end
  end
end
