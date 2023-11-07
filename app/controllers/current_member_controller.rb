class CurrentMemberController < ApplicationController
    before_action :authenticate_member!
    
    
    def index
        
        render json: MemberSerializer.new(current_member).serializable_hash[:data][:attributes], status: :ok
    end
end
