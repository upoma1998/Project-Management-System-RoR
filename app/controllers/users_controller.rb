class UsersController < ApplicationController
   
    before_action :add_orga, only: [:show, :destroy, :update]
    def index
        @user=User.all
       
        render json:@user
    end
    def show
        render json:@user
    
    end
    
    
    
    def create
        @user=User.new(email: orga_params[:email],
            password: orga_params[:password]
           
           
          )
          
        if @user.save
            render json:@user,status: :created,location:@user
        else 
            
            render json: @user.errors, status: :unprocessable_entity
        end
    end
    def update
        user=User.find_by(id: params[:id])
            if user
            user.update(
            email: params[:email],
            password: params[:password]
            
          
            )
            render json:"User updated successfully"

            else
            render json: {
                error:"User Not Updated"
            }
            end

    end
      
    
    def destroy
        user=User.find(params[:id])
            if user
                user.destroy
                render json:"User has been deleted"
            
            else 
            
            render status: :no_content
            end
    end
    private
    def add_orga
        @user=User.find(params[:id])
        #@organization=Organization.find(params[:id])
    end
    def orga_params
        params.require(:user).permit([
          :email,
          :password,
          
        ])
    end

end
