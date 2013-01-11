class CreateLastJobDetails < ActiveRecord::Migration
  def change
    create_table :last_job_details do |t|
      t.string :company
      t.datetime :start_date
      t.datetime :end_date
      t.string :job_description
      t.integer :employee_detail_id

      t.timestamps
    end
  end
end
