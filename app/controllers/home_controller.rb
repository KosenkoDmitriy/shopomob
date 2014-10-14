class HomeController < ApplicationController

  def index
    @posts = Post.all
    @services = Service.all
  end

  #def create
    #UserMailer.welcome_email(@user).deliver
  #end
  def order
    UserMailer.order_email(params).deliver
  end

  def subscribe
    UserMailer.order_email(params).deliver
    redirect_to action: 'index'
  end
end
