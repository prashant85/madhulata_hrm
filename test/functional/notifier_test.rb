require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "sending_request" do
    mail = Notifier.sending_request
    assert_equal "Sending request", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "response_request" do
    mail = Notifier.response_request
    assert_equal "Response request", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
