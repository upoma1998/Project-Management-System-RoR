class PaidProjectsController < ApplicationController
    load_and_authorize_resource param_method: :project_params
    before_action :add_orga, only: [:show, :destroy, :update]
    
    def index
        @paid_project=PaidProject.all
        render json:@paid_project
    end
    def show
        render json:@paid_project
    
    end
    
    def create
        @paid_project=PaidProject.new(
            
            project_params.merge(user:@user) 
          )
          
        if @paid_project.save
            render json:@paid_project,status: :created,location:@paid_project
        else 
            
            render json: @paid_project.errors, status: :unprocessable_entity
        end
    end
    
    def update
        
            if @paid_project.update(project_params)
            render json: @paid_project
            else
            render json: @paid_project.errors, status: :unprocessable_entity
            end
    end
            
          
           
      
    
      def destroy
        @paid_project.destroy
        
        
      end
    private 
    def add_orga
        @paid_project=PaidProject.find(params[:id])
       
       
    end

    def check_admin
            users=User.last
            if !users.role=='super_admin'
                return "You are not allowed to access this part of the site"
            end
    end

   
    def project_params
        params.require(:paid_project).permit([
            :project_name,
            :start_date,
            :completion_date
          
        ])
    end
    
end
