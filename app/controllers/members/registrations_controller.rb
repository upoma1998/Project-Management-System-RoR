# frozen_string_literal: true

class Members::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  private

  def respond_with(resource, opts={})
    if request.method == "POST" && resource.persisted?
      render json: {
        status: {code:200,message: 'Signed Up Successfully',
        data: MemberSerializer.new(resource).serializable_hash[:data][:attributes]}

      },status: :ok
    elsif request.method =="DELETE"
      render json:{
        status:{code:200, message:'Account deleted successfully'}
      }, status: :ok
    else

      render json:{
        status:{message:'User not signed up',
        errors:resource.errors.full_messages}, status: :unprocessable_entity
      }
    end

  end

end
