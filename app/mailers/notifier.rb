class Notifier < ActionMailer::Base
   #default from: "example@gmail.com"
  # default from: @current_user
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.sending_request.subject
  # :from=> "prashant@rubyonrails4ror.com",
  def sending_request(leaveapplication)
    @leaveapplication = leaveapplication 
    mail :to => "prashant@rubyonrails4ror.com",
     :cc => ["badri@drupaltechie.com"],
      :subject => 'Leave application'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.response_request.subject
  #
  def response_request(leaveapplication)
     @leaveapplication = leaveapplication   
    mail :to=> "badri@drupaltechie.com",:cc => User.find(@leaveapplication.user_id).email.to_s,:subject=>"Response"
  end
end
