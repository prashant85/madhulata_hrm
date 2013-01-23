module LeaveapplicationsHelper
  def total_day 
	 if join_date.strftime("%y") == Time.now.strftime("%y")
          join_date.yday 
      elsif Time.now.strftime("%y").to_i-join_date.strftime("%y").to_i == 1 
           Time.now.yday + 365 - join_date.yday 
      else 
         365*(Time.now.strftime("%y").to_i- join_date.strftime("%y").to_i-1) + (Time.now.yday + 365 - join_date.yday)
        end    
	end

  def join_date
		EmployeeDetail.find(current_user.id).join_date
  end

  def casual_leave
  	 if Time.now.strftime("%y").to_i != join_date.strftime("%y").to_i
  		Time.now.strftime("%m").to_i 
  	 elsif
        a.strftime("%d") > 15 
        (Time.now.strftime("%m").to_i - a.strftime("%m").to_i)-1 
     else 
        Time.now.strftime("%m").to_i - a.strftime("%m").to_i 
     end     
  end 

  def priviledge_leave
  	    if total_day > 180
  		   casual_leave
    	else
  		  "Not applicatable for priviledge_leave"
        end
  end

  def total_leave
    if total_day >180
        priviledge_leave+casual_leave
    else
        casual_leave
    end 
  end
end
