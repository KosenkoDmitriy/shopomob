class UserMailer < ActionMailer::Base
  #default from: "shopomob@shopomob.ru"
  #default from: "kosenkodmitryv@gmail.com"
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Добро пожаловать!")
  end

  def order_email(params)
    if params['email'].present?
      mail(to:params['email'], subject: "Адек. Заказ успешно создан.")#, body: params.to_s)
    end
  end

  def subscribe_email(email, data)
    mail(to:email, subject: "Адек. Вы подписаны на рассылку!")#, body: data)
  end

  def notify_me(email, subject, body)
    mail(to:email, subject: subject, body: body)
  end

end
