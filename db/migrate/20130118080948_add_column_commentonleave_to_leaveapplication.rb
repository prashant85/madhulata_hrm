class AddColumnCommentonleaveToLeaveapplication < ActiveRecord::Migration
  def change
    add_column :leaveapplications, :commentonleave, :string
  end
end
