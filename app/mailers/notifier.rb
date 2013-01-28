class Notifier < ActionMailer::Base
   #default from: "example@gmail.com"
  # default from: @current_user
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.sending_request.subject
   default :from => "webmaster@rubyonrails4ror.com"
  def sending_request(leaveapplication)
    @leaveapplication = leaveapplication 
     mail :to => "abhijeet@drupaltechie.com",
          :bcc => ["renu@drupaltechie.com"],:cc => ["prashant@rubyonrails4ror.com"],
         :subject => 'Leave application'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.response_request.subject
  #
  def response_request(leaveapplication)
     @leaveapplication = leaveapplication   
    mail :to=> User.find(@leaveapplication.user_id).email.to_s,:cc=> "abhijeet@drupaltechie.com",:subject=>"Response"
  end

  def acceptence_info(employee_detail)  
    @employee_detail = employee_detail
    mail :to => User.find(@employee_detail.id).email.to_s,:subject => "acceptence_info"
  end

  def confirmation_request(employee_detail)
    @employee_detail = employee_detail
    mail :to => "renu@drupaltechie.com",:subject => "confirmation_request"  
  end  


end
