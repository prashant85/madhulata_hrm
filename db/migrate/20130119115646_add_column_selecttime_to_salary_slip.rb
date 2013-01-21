class AddColumnSelecttimeToSalarySlip < ActiveRecord::Migration
  def change
    add_column :salary_slips, :selecttime, :datetime
  end
end
