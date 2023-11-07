class CurrentUserController < ApplicationController
    
   
    before_action :authenticate_organization!
    
    
    def index
        #jwt_payload=JWT.decode(request.headers['Authorization'].split(' ')[1], Rails.application.credentials.fetch(:secret_key_base)).first
        #puts(jwt_payload)
        #current_user=Organization.find(jwt_payload['sub'])
        #render json: current_organization, status: :ok
        render json: OrganizationSerializer.new(current_organization).serializable_hash[:data][:attributes], status: :ok
    end

end
