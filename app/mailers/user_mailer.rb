class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_user_welcome.subject
  #
  def new_user_welcome(user)
    @user = user
    mail to: user.email, subject: "Bienvenido a TuCasa.com"
    mail.transport_encoding = "8bit"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Cambio de Contraseña"
    mail.transport_encoding = "8bit"
  end
end
