class FreeProject < ApplicationRecord
   
    load_and_authorize_resource param_method: :orga_params
    before_action :add_orga, only: [:show, :destroy, :update]
      def index
          @free_project=FreeProject.all
          render json:@free_project
      end
      def show
          render json:@free_project
      
      end
      
      def create
          @free_project=FreeProject.new(
              
              free_params.merge(user:@user) 
            )
            
          if @free_project.save
              render json:@free_project,status: :created,location:@free_project
          else 
              
              render json: @free_project.errors, status: :unprocessable_entity
          end
      end
      
        def update
          
              if @free_project.update(project_params)
              render json: @free_project
              else
              render json: @free_project.errors, status: :unprocessable_entity
              end
        end
              
            
             
        
      
        def destroy
          @free_project.destroy
          
          
        end
      private 
      def add_orga
          @free_project=FreeProject.find(params[:id])
         
         
      end
      def orga_params
          params.require(:free_project).permit([
              :project_name,
              :start_date,
              :completion_date
            
          ])
      end
  
  end
  
