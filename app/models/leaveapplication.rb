class Leaveapplication < ActiveRecord::Base
  attr_accessible :comment, :description, :from, :leavetype, :name, :subject, :to, :user_id
  belongs_to :user
end
