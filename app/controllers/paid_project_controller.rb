class PaidProjectController < ApplicationController
    before_action :authenticate_organization!
    before_action :add_orga, only: [:paid_project_show, :paid_project_destroy, :paid_project_update]
      def task_index
        begin
          @paid_project=PaidProject.all
          render json:@paid_project
        rescue => e
            render_api_error(e.message, :internal_server_error)
        end
      end
      def paid_project_show
        begin
          render json:@paid_project
        rescue => e
            render_api_error(e.message, :internal_server_error)
        end
      
      end
      
      def paid_project_create
        begin
          paid_project = current_user.paid_projects.create(orga_params)
          
          if paid_project.save
            render json: { message: 'Project created successfully' }, status: :ok
          else
            render json: { message: 'Failed to create project successfully' }, status: :ok
          end
        rescue => e
          render_api_error(e.message, :internal_server_error)
        end
        
        
      end
      
        def paid_project_update
            begin
              if @paid_project.update(orga_params)
              
                render json: { message: 'Project updated successfully' }, status: :ok
              else
                render json: { error: 'Failed to update the project' }, status: :unprocessable_entity
            end
              end
            rescue => e
                render_api_error(e.message, :internal_server_error)

            end
        end
              
            
        def paid_project_destroy
            begin
                if  @paid_project.destroy
                    render json: { message: 'Project deleted successfully' }, status: :ok
                else
                    render json: { error: 'Failed to delete the project' }, status: :unprocessable_entity

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
      def add_orga
          @paid_project=PaidProject.find(params[:id])
         
         
      end
      def orga_params
          params.require(:paid_project).permit([
              :project_name,
              :start_date,
              :completion_date
            
          ])
      end
    
end
