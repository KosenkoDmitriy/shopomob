class UserMailer < ActionMailer::Base
  #default from: "shopomob@shopomob.ru"
  #default from: "kosenkodmitryv@gmail.com"
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Добро пожаловать!")
  end

  def order_email(params)
    if params['email'].present?
      mail(to:params['email'], subject: "order", body: params.to_s)
    end
  end

  def subscribe_mail(params)

    if params['email'].present?
      mail(to:params['email'], subject: "subscribe", body: params.to_s)
    end
  end
end
