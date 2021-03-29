class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :flash_message
  before_action :configure_permitted_parametrs, if: :devise_controller?

  private

  def flash_message(type, message)
    flash[type] = message
  end

  def configure_permitted_parametrs
    devise_parametr_sanitizer.permit(:sign_up, keys: [:email, :password, :name, :last_name])
  end

  def after_sign_in_path_for
    flash_message :notice, "Hello there #{resource.name}!"
    resource.admin? ? admin_tests_path : super
  end
end
