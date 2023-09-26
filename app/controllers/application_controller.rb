class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :masquerade_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def filtered_user
    @filtered_user ||= current_user.admin? ? params[:user_id] : current_user
  end
end
