class AddColumnLeaveToLeaveapplication < ActiveRecord::Migration
  def change
    add_column :leaveapplications, :casual_leave, :integer
    add_column :leaveapplications, :previlige_leave, :string
  end
end
