class Leaveapplication < ActiveRecord::Base
  attr_accessible :comment, :description, :from, :leavetype, :name, :subject, :to,
   :user_id,:employee_detail_id
  belongs_to :user
  belongs_to :employee_detail
  def casual_leave
  	leave = Time.now.strftime("%m").to_i
  	if Time.now.strftime("%d").to_i < 14
  		leave-1
  	end	    
  end
  # def total_day
  #   # @leaveapplication = Leaveapplication.find(:id)
  #   #Time.now
  #   # User.find(@leaveapplication.user_id).email.to_s,
  #   #EmployeeDetail.find(@leaveapplication.employee_detail_id).join_date
  #   #current_user.id
  #    #@leaveapplication.name
  #  #@leaveapplication.subject
  # 	# Employee_detail.find(@leaveapplication.employee_detail_id).join_date
  # 	# days = joindate.yday
  # 	# totaldays = days
  # 	# if joindate.strftime("%y") != Time.now.strftime("%y")
  #  # 		today = Time.now.yday
  # 	# 	totaldays =+ today 
  #  #  end  	
  # end	

  def previlige_leave
      leave = Time.now.strftime("%m").to_i
    # if Time.now.strftime("%d").to_i < 14
    #   leave-1
    # end     
  end

  def prashant
  	Time.now
  	# joindate = Employee_detail.find(@leaveapplication.employee_detail_id).join_date
  end
end