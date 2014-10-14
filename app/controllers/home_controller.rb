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
    if params['email'].present?
      UserMailer.subscribe_email(params['email']).deliver
    end
    #redirect_to action: 'index'
    respond_to do |format|
      format.html { render json: params}
    end
  end
end
