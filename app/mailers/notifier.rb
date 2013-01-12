class Notifier < ActionMailer::Base
   default from: "example@gmail.com"
  # default from: @current_user
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.sending_request.subject
  #
  def sending_request(leaveapplication)
    @leaveapplication = leaveapplication 
    mail :to => "prashant@rubyonrails4ror.com",
     :cc => ["bcc@example.com","watcher@example.com"],
      :subject => 'Leave application'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.response_request.subject
  #
  def response_request
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
