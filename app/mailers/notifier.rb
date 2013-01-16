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
          :bcc => ["badri@drupaltechie.com"],
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
end
