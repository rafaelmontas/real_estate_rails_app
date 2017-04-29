require 'test_helper'

class UserMailerTest < ActionMailer::TestCase

  test "new_user_welcome" do
    user = users(:rafael)
    mail = UserMailer.new_user_welcome(user)
    assert_equal "Bienvenido a TuCasa.com", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@example.com"], mail.from
    assert_match user.name, mail.body.encoded
  end

end
