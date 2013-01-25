class Leaveapplication < ActiveRecord::Base
  attr_accessible :comment, :description, :from, :leavetype, :name, :subject, :to,
   :user_id,:employee_detail_id, :commentonleave 
  belongs_to :user
  belongs_to :employee_detail

  def prashant
  	Time.now
  end

end