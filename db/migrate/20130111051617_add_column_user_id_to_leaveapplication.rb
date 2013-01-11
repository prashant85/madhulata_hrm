class AddColumnUserIdToLeaveapplication < ActiveRecord::Migration
  def change
    add_column :leaveapplications, :user_id, :integer
  end
end
