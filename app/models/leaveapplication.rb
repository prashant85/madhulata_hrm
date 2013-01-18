class Leaveapplication < ActiveRecord::Base
  attr_accessible :comment, :description, :from, :leavetype, :name, :subject, :to,
   :user_id,:employee_detail_id, :commentonleave 
  belongs_to :user
  belongs_to :employee_detail
  def casual_leave
  	leave = Time.now.strftime("%m").to_i
    if Time.now.strftime("%d").to_i < 14
      leave = leave-1
    end
    leave
  end

  def joining

      EmployeeDetail.where(:id=> user_id)
    end

   def previlige_leave
     self.joining
   end
   def total_day
    Time.now.yday
     #dateofjoining=EmployeeDetail.find(@leaveapplication.employee_detail_id).join_date
    #   # EmployeeDetail.find(current_user.id).join_date
    #   if dateofjoining.strftime("%y").to_i != Time.now.strftime("%y").to_i
    #      if
    #        dateofjoining.strftime("%y").to_i-Time.now.strftime("%y").to_i >= 2
    #        a = dateofjoining.strftime("%y").to_i-Time.now.strftime("%y").to_i
    #        days = (a-1)*365 +(364 - EmployeeDetail.find(current_user.id).join_date.yday + Time.now.yday )
    #       else  
    #        days = 364 - EmployeeDetail.find(current_user.id).join_date.yday + Time.now.yday 
    #      end
    #    end
    #     days =  dateofjoining.yday 
    #   # 364 - EmployeeDetail.find(current_user.id).join_date.yday + Time.now.yday 
  end
  

 

  def prashant
  	Time.now
  	# joindate = Employee_detail.find(@leaveapplication.employee_detail_id).join_date
  end

end