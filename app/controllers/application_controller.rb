class ApplicationController < ActionController::Base
  include Pundit
  include Pagy::Backend
  before_action :configure_permitted_parameters, if: :devise_controller?
  around_action :switch_locale

  rescue_from Pundit::NotAuthorizedError do |exception|
    redirect_to root_url, alert: exception.message
  end

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def default_url_options(options={})
    { locale: I18n.locale }
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:full_name])
  end
end