class HomeController < ApplicationController
  
  add_breadcrumb I18n.t("menu.main").upcase, :root_path

  def index
    #@about = StaticContent.with_translations(I18n.locale).find_by(tags: 'about')
    #@timeline = StaticContent.with_translations(I18n.locale).find_by(tags: 'timeline')
    @about = StaticContent.find_by(tags: 'about')
    @timeline = StaticContent.find_by(tags: 'timeline')

    @posts = Post.with_translations(I18n.locale).last(12)
    @services = Service.with_translations(I18n.locale).where(is_visible: true)
    @galleries = Gallery.with_translations(I18n.locale)
    #@posts = Post.all
    #@order.users.build
    @order = Order.new
    @customer = Customer.new
    @teamers = Teamer.with_translations(I18n.locale)

    #@posts = Post.with_translations(params[:locale]).last(12)
    #@services = Service.with_translations(params[:locale])
    #@galleries = Gallery.with_translations(params[:locale])
    ##@posts = Post.all
    ##@order.users.build
    #@order = Order.new
    #@customer = Customer.new
    #@teamers = Teamer.with_translations(params[:locale])
  end

  def index2
    redirect_to root_path
  end

  #def create
  #UserMailer.welcome_email(@user).deliver
  #end

  def order

    if simple_captcha_valid?
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
        flash[:notice] = I18n.t("saved.ok")
        UserMailer.order_email(params).deliver
        UserMailer.notify_me(Rails.application.config.action_mailer.default_options[:from], 
          I18n.t("mail.order.title"), params.to_s).deliver
      else
        flash[:error] = I18n.t("saved.not")
      end
    end

    redirect_to :root
    #redirect_to :index_path #TODO: show resule template or flash.notice
    #respond_to do |format|
    #  format.html { render json: params }
    #end
    #do this
    else
      #do that
      flash[:error] = I18n.t("simple_captcha.message.default")
      #redirect_to "/#contacts"
      #redirect_to request.path, :params => params
      redirect_to :root, :params => params# + "#contacts"
      #s = params.to_s
      #redirect_to "/ru/#contacts?name=12312&phone=123&note=duplicate"
      #redirect_to "/"+params[:locale] || ""+"/#contact", :params => params# + "#contacts"
    end
  end

  def subscribe
    email = params['email'] if params['email'].present?
    u = Customer.new
    u.email = email
    u.save!
    if email
      UserMailer.subscribe_email(email, params.to_s).deliver
      UserMailer.notify_me(Rails.application.config.action_mailer.default_options[:from], 
        I18n.t("mail.subscribe.title"), params.to_s).deliver
      flash[:notice] = I18n.t("mail.subscribe.flash_notice")
    end
    #respond_to do |format|
    #  format.html { render json: params }
    #end

    redirect_to :root
    #redirect_to action: 'index'
  end

  def calculate
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
      order.details = details || "\n\n"
      calc_info = I18n.t("mail.calculate.header")
      if (services.present?)
        total_price = 0
        services.each do |service|
          s = Service.find(service[0].to_i)
          s_value = service[1].to_f
          if s && s_value > 0
            s.service_tarifs.each do |s_tarif|
              #stp=ServiceTarifPrice.where("condition1 <= #{s_value} and condition2 >= #{s_value} and service_tarif_id = #{s_tarif.id}")
              #if stp.present? && stp.nil?
              #  price = s_value * stp.price
              #  total_price += price
              #  calc_info += "#{s.title}: #{stp.price.to_f}x#{s_value}=#{price} \n"
              #end
              s_tarif.service_tarif_prices.each do |stp|
                if (stp.condition1 <= s_value && s_value <= stp.condition2)
                  price = s_value * stp.price
                  total_price += price
                  calc_info += "#{s.title} (#{I18n.t("tarif")}: \" #{s_tarif.title} \")\n #{stp.price.to_f} #{I18n.t("rub")} x #{s_value} #{I18n.t("m2")} = #{price} #{I18n.t("rub")} \n\n"
                end
              end
            end
          end

          if s
            order.services.append(s)
          end
        end
        #calc_info += "\nИтого: #{total_price} рублей"
        calc_info += I18n.t("mail.calculate.footer")
        order.details += calc_info if calc_info.present?
      end

      customer.orders.append(order)
      if (customer.save!)
        flash[:notice] = I18n.t("saved.ok")
        #UserMailer.order_email(params).deliver
        UserMailer.notify_me(customer.email, I18n.t("mail.order.title"), calc_info).deliver
        UserMailer.notify_me(Rails.application.config.action_mailer.default_options[:from], I18n.t("mail.order.title"), calc_info).deliver
      else
        flash[:error] = I18n.t("saved.not")
      end
    end

    redirect_to :root
  end

  def portfolio
    if params['id'].present?
      id = params['id']
      @gallery = Gallery.find(id)
    end

    add_breadcrumb I18n.t(:projects), :portfolios_path
    add_breadcrumb I18n.t(:project), :portfolio_path
  end

  def portfolios
    @galleries=Gallery.all

    add_breadcrumb I18n.t(:projects), :portfolios_path
  end

  private
 
  def create_user
    email = params['email'] if params['email'].present?
    username = params['username'] if params['username'].present?
    user = User.find_by(email: email)
    if user
      flash[:notice] = I18n.t("mail.exists")
    else
      user = User.create(email: email, name: username)
    end
  end
end
