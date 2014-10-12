class UserMailer < ActionMailer::Base
  #default from: "shopomob@shopomob.ru"
  #default from: "kosenkodmitryv@gmail.com"
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Добро пожаловать!")
  end
end
