class ApplicationController < ActionController::API

    before_action :authenticate_user!
    rescue_from CanCan::AccessDenied do |exception|
        render json: {warning: exception,status: 'authorization_failed'}
    end     
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected
    def configure_permitted_parameters
        
        added_attrs = [:role]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs

    end
end
