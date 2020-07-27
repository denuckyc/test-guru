class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :flash_message

  def flash_message(type, message)
    flash[type] = message
  end
end
