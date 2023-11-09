class FreeProject < ApplicationRecord
    
    before_action :authenticate_member!
    before_action :add_orga, only: [:free_project_show, :free_project_destroy, :free_project_update]
      def task_index
        begin
          @free_project=FreeProject.all
          render json:@free_project
        rescue => e
            render_api_error(e.message, :internal_server_error)
        end
      end
      def free_project_show
        begin
          render json:@free_project
        rescue => e
            render_api_error(e.message, :internal_server_error)
        end
      
      end
      
      def free_project_create
        begin
          free_project = current_user.free_projects.create(free_project_params)
          
          if free_project.save
            render json: { message: 'Project created successfully' }, status: :ok
          else
            render json: { message: 'Failed to create project successfully' }, status: :ok
          end
        rescue => e
          render_api_error(e.message, :internal_server_error)
        end
        
        
      end
      
        def free_project_update
            begin
              if @free_project.update(orga_params)
              
                render json: { message: 'Project updated successfully' }, status: :ok
              else
                render json: { error: 'Failed to update the project' }, status: :unprocessable_entity
            end
              end
            rescue => e
                render_api_error(e.message, :internal_server_error)

            end
        end
              
            
        def free_project_destroy
            begin
                if  @free_project.destroy
                    render json: { message: 'Project deleted successfully' }, status: :ok
                else
                    render json: { error: 'Failed to delete the project' }, status: :unprocessable_entity

                rescue => e
                    render_api_error(e.message, :internal_server_error)
            end
          
          
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
      def assigned_tasks

        begin
          task = current_user.tasks.all
          render json: TaskSerializer.new(task), status: :ok
        rescue => e
          render_api_error(e.message, :internal_server_error)
        end
    
      end
    
      def update_tsak
    
        begin
          task = current_user.tasks.find_by(id: params[:id])
    
          if task.nil?
            render_api_message("task not found", :not_found)
          elsif task.update(task_params)
            render_api_message("updated", :ok)
          else
            render_api_error(task.errors, :unprocessable_entity)
          end 
        rescue => e
          render_api_error(e.message, :internal_server_error)
        end
    
      end
  
  end
  
