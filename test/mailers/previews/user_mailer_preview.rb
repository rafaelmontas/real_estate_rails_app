# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/new_user_welcome
  def new_user_welcome
    user = User.first
    UserMailer.new_user_welcome(user)
  end

end
