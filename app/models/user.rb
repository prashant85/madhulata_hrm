class User < ActiveRecord::Base
  before_create :employee_information 
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:name
  has_many :leaveapplications
  has_one :employee_detail
  after_create :send_welcome_mail
  # attr_accessible :title, :body
  
  def employee_information
   id = self.id
    name = self.name
   EmployeeDetail.create(:name => self.name, :id => self.id)
  
  end
  def send_welcome_mail
    Notifier.confirmation_request(@employee_detail).deliver
  end

  
end
