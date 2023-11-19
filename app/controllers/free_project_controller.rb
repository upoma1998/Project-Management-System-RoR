class FreeProject < ApplicationRecord
    
    before_action :authenticate_organization!
    before_action :add_orga, only: [:free_project_show, :free_project_destroy, :free_project_update]
      def task_index
        begin
          @free_project=FreeProject.all
          render json:@free_project
        rescue => e
            render_api_error(e.message, :internal_server_error)
        end
      end
      
        def assigned_tasks

          begin
            task = current_user.tasks.all
            render json: TaskSerializer.new(task), status: :ok
          rescue => e
            render_api_error(e.message, :internal_server_error)
          end
      
        end
      
        def update_task
      
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
      private 
      
      
  
  end
  
