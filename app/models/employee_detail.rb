class EmployeeDetail < ActiveRecord::Base
  attr_accessible :category,:photos_attributes, :image, :contract_detail, :employement_status,
   :job_specification, :job_title, :join_date, :local_address, :location, :name, :permanent_address,
    :phone_no, :sub_unit, :last_job_details_attributes
  has_many :photos
  has_many :last_job_details
  accepts_nested_attributes_for :photos, :allow_destroy => true 
  accepts_nested_attributes_for :last_job_details, :allow_destroy => true 
end
