class HomeController < ApplicationController

  def index
    @posts = Post.all
    @services = Service.all
    @order = Order.new
    #@order.users.build
  end

  #def create
    #UserMailer.welcome_email(@user).deliver
  #end

  def order
    #params['']
    #Order.new(is_offer:)
    UserMailer.order_email(params).deliver
  end

  def subscribe
    if email
      UserMailer.subscribe_email(email, params.to_s).deliver
    end
    #redirect_to action: 'index'
    respond_to do |format|
      format.html { render json: params }
    end
  end

  private
    def create_user
      email = params['email'] if params['email'].present?
      username = params['username'] if params['username'].present?
      user = User.find_by(email:email)
      if user
        flash[:notice] = "already have email"
      else
        user = User.create(email:email, name:username)
      end

    end
end
