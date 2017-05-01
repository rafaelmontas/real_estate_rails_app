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

  test "password reset" do
    user = users(:rafael)
    user.reset_token = User.new_token
    mail = UserMailer.password_reset(user)
    assert_equal "Cambio de Contraseña", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@example.com"], mail.from
    assert_match user.name, mail.body.encoded
    assert_match CGI.escape(user.email), mail.body.encoded
  end

end
