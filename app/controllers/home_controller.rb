class HomeController < ApplicationController

  def index
    @posts = Post.all
    @services = Service.all
  end

  #def create
    #UserMailer.welcome_email(@user).deliver
  #end
end
