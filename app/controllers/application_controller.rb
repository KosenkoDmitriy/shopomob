class ApplicationController < ActionController::Base
  theme :theme_resolver
  before_action :set_locale

  include SimpleCaptcha::ControllerHelpers
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def default_url_options(options={})
    # logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { locale: I18n.locale }
  end

  private
  
    def theme_resolver
      I18n.load_path += Dir[Rails.root.join('app/themes', Rails.application.config.theme, 'locales', '**', '*.yml').to_s]
      params[:theme].presence || Rails.application.config.theme
    end

    def set_locale
      I18n.locale = params[:locale].presence || I18n.default_locale
    end

end
