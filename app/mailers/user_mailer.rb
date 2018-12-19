class UserMailer < ActionMailer::Base
  #default from: "shopomob@shopomob.ru"
  #default from: "kosenkodmitryv@gmail.com"
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: I18n.t("mail.message") )
  end

  def order_email(params)
    if params['email'].present?
      mail(to: params['email'], subject: I18n.t("mail.order_created") )#, body: params.to_s)
    end
  end

  def subscribe_email(email, data)
    mail(to: email, subject: I18n.t("mail.subscribed") )#, body: data)
  end

  def notify_me(email, subject, body)
    mail(to: email, subject: subject, body: body)
  end

end
