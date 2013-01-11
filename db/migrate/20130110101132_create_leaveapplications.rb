class CreateLeaveapplications < ActiveRecord::Migration
  def change
    create_table :leaveapplications do |t|
      t.string :name
      t.string :subject
      t.string :description
      t.string :leavetype
      t.datetime :from
      t.datetime :to
      t.string :comment

      t.timestamps
    end
  end
end
