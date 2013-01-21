class CreateSalarySlips < ActiveRecord::Migration
  def change
    create_table :salary_slips do |t|
      t.string :gross_salary
      t.string :deduction
      t.string :net_salary
      t.integer :employtee_detail_id

      t.timestamps
    end
  end
end
