class Users1Controller < ApplicationController
    
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
            password: orga_params[:password],
            role: orga_params[:role]
           
          )
          
        if @user.save
            render json:"User created successfully"
        else 
            
            render json: @user.errors, status: :unprocessable_entity
        end
    end
    def update
        if @user.update(orga_params)
            render json: @user
            else
            render json: @user.errors, status: :unprocessable_entity
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
    def check_admin
        users=User.last
        if !users.role=='super_admin'
            return "You are not allowed to access this part of the site"
        end
    end
    def add_orga
        @user=User.find(params[:id])
        #@organization=Organization.find(params[:id])
    end
    def orga_params
        params.require(:user).permit([
          :email,
          :password,
          :role
        ])
    end

end
