class EmployeeDetail < ActiveRecord::Base
  
  attr_accessible :category,:photos_attributes, :image, :contract_detail, :employement_status,
   :job_specification, :job_title, :join_date, :local_address, :location, :name, :permanent_address,
    :phone_no, :sub_unit, :last_job_details_attributes, :user_id, :confirmation_date, :father_name, :email, 
    :blood_group, :date_of_birth, :phone_number,:account_no
  belongs_to :user
  has_many :leaveapplications
  has_many :salary_slips
  has_many :photos
  has_many :last_job_details
  accepts_nested_attributes_for :photos, :allow_destroy => true 
  accepts_nested_attributes_for :last_job_details, :allow_destroy => true 
  

  #  def previlige_leave
  #    self.total_day
  #  end
  #  def total_day
  #    Time.now.yday
  #    #dateofjoining=EmployeeDetail.find(@leaveapplication.employee_detail_id).join_date
  #   #   # EmployeeDetail.find(current_user.id).join_date
  #   #   if dateofjoining.strftime("%y").to_i != Time.now.strftime("%y").to_i
  #   #      if
  #   #        dateofjoining.strftime("%y").to_i-Time.now.strftime("%y").to_i >= 2
  #   #        a = dateofjoining.strftime("%y").to_i-Time.now.strftime("%y").to_i
  #   #        days = (a-1)*365 +(364 - EmployeeDetail.find(current_user.id).join_date.yday + Time.now.yday )
  #   #       else  
  #   #        days = 364 - EmployeeDetail.find(current_user.id).join_date.yday + Time.now.yday 
  #   #      end
  #   #    end
  #   #     days =  dateofjoining.yday 
  #   #   # 364 - EmployeeDetail.find(current_user.id).join_date.yday + Time.now.yday 
  # end
  
end
