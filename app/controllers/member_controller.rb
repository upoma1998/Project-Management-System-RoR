class MemberController < ApplicationController
    before_action :authenticate_member!
    before_action :add_task, only: [:task_show, :task_destroy, :task_update]
    
      
      
      
      def task_create
        
            begin
                task = current_member.tasks.create(task_params)
                
                if task.save
                    render json: { message: 'Task created successfully' }, status: :ok
                else
                    render json: { error: 'Failed to create the task' }, status: :unprocessable_entity
                end
              rescue => e
                render_api_error(e.message, :internal_server_error)
            end
         
      end
      
        def task_update
            begin
              if @task.update(task_params)
              
                render json: { message: 'Task updated successfully' }, status: :ok
              else
                render json: { error: 'Failed to update the task' }, status: :unprocessable_entity
            
              end
            rescue => e
                render_api_error(e.message, :internal_server_error)

            end
        end
              
            
        def task_destroy
            begin
                if  @task.destroy
                    render json: { message: 'Task deleted successfully' }, status: :ok
                else
                    render json: { error: 'Failed to delete the task' }, status: :unprocessable_entity
                end
                rescue => e
                    render_api_error(e.message, :internal_server_error)
                
            end
          
          
        end
        def assign_task

          begin
            task = current_user.members.find_by(id: params[:id]).tasks.create(task_param)
            if task.save
             
              render json: { message: 'Task assigned successfully' }, status: :ok
              
            else
              render json: { message: 'Failed to assign Task successfully' }, status: :unprocessable_entity
            end     
          rescue => e
            render_api_error(e.message, :internal_server_error)
          end
      
        end
      
        def assign_task_view
      
          begin
            member = current_user.members
            task = Task.where(member_id: member.pluck(:id))
            render json: TaskSerializer.new(task), status: :ok
          rescue => e
            render_api_error(e.message, :internal_server_error)
          end
      
        end

        

      
      private 
      def add_task
          @task=Task.find(params[:id])
         
         
      end
      def task_params
          params.require(:task).permit([
              :assigned_task,
              :total_time,
              :completed_task,
              :incomplete_task,
              :time_needed,
              :dependency_on_member_name,
              :status
            
          ])
      end
           
end
