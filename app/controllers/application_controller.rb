class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :category, :name, :first_name)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :current_password, :category, :name, :first_name)}
    end
end
