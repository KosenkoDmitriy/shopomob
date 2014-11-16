class HomeController < ApplicationController
  def index
    @posts = Post.all
    @services = Service.all
    @galleries = Gallery.all
    #@posts = Post.all
    #@order.users.build
    @order = Order.new
    @customer = Customer.new
    @teamers = Teamer.all
  end

  #def create
  #UserMailer.welcome_email(@user).deliver
  #end

  def order
    #params['']
    #Order.new(is_offer:)
    name = params['name'] if params['name'].present?
    email = params['email'] if params['email'].present?
    phone = params['phone'] if params['phone'].present?
    services = params['services'] if params['services'].present?
    details = params['details'] if params['details'].present?

    if (name && email && phone)
      customer = Customer.find_or_create_by(email: email)
      customer.name = name
      customer.email = email
      customer.phone = phone
      order = Order.new
      order.details = details
      if (services.present?)
        services.each do |service|
          s=Service.find(service[0].to_i)
          if s
            order.services.append(s)
          end
        end
      end

      customer.orders.append(order)
      if (customer.save!)
        flash[:notice] = "saved"
        UserMailer.order_email(params).deliver
        UserMailer.notify_me("adec@adec.name", "adec. new order", params.to_s).deliver
      else
        flash[:error] = "not saved"
      end
    end

    redirect_to :index_path #TODO: show resule template or flash.notice
    #respond_to do |format|
    #  format.html { render json: params }
    #end
  end

  def subscribe
    email = params['email'] if params['email'].present?
    u = Customer.new
    u.email = email
    u.save!
    if email
      UserMailer.subscribe_email(email, params.to_s).deliver
      UserMailer.notify_me("adec@adec.name", "adec. new user subscribed", params.to_s).deliver
      flash[:notice] = "успешно подписаны на рассылку"
    end
    #respond_to do |format|
    #  format.html { render json: params }
    #end

    redirect_to :root
    #redirect_to action: 'index'

  end

  private
  def create_user
    email = params['email'] if params['email'].present?
    username = params['username'] if params['username'].present?
    user = User.find_by(email: email)
    if user
      flash[:notice] = "already have email"
    else
      user = User.create(email: email, name: username)
    end
  end
end
