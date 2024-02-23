# frozen_string_literal: true

class Admins::SessionsController < Devise::SessionsController
  respond_to :json
  private
 
  def respond_with(resource, opts={})
   render json:{
     status: { code: 200, message:"User signed in successfully",
     
     data: AdminSerializer.new(resource).serializable_hash[:data][:attributes] }
 }, status: :ok
     #render json:{
         #status: { code: 200, message:"User signed in successfully",
         
         #data: current_organization }
       #}, status: :ok
  end
  def respond_to_on_destroy

       if current_admin
         render json:{
           status:200,
           message:"Signed Out Successfully"
         }, status: :ok
       else
         render json:{
           status: 401,
           message:"User has no active session"
         }, status: :unauthorized
       end
   end
end
