class HomeController < ApplicationController

  def create
    UserMailer.welcome_email(@user).deliver

  end
end
