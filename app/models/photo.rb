class Photo < ActiveRecord::Base
  attr_accessible :employee_detail_id, :image
   belongs_to :employee_detail
   has_attached_file :image,
    :styles => { :medium => "300x300>", :thumb => "100x100>", :large => "700x500>" },
    :storage => :dropbox,
    :path => "/:application_name/:model_name/:id/:style/:filename"
end
