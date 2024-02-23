class ApplicationController < ActionController::API

  #before_action :authenticate_user!
 
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    if resource_class == Organization
      devise_parameter_sanitizer.permit(:sign_up, keys: [:confirm_password, :name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:password, :confirm_password, :name])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:password, :confirm_password, :name])
     
    elsif resource_class == Admin
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :confirm_password, :username])
      devise_parameter_sanitizer.permit(:account_update, keys: [:password, :confirm_password, :username])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :password])
    elsif resource_class == Member
      devise_parameter_sanitizer.permit(:sign_up, keys: [:confirm_password, :first_name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:password, :confirm_password, :first_name])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:first_name, :password])
    end
  end
  



end