class OrganizationController < ApplicationController
    before_action :authenticate_organization!
    before_action :add_free_project, only: [:free_project_show, :free_project_destroy, :free_project_update]
    before_action :add_paid_project, only: [:paid_project_show, :paid_project_destroy, :paid_project_update]
    before_action :add_task, only: [:task_index, :task_show]
      def free_project_index
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
                free_project = current_organization.free_projects.create(free_project_params)
                
                if free_project.save
                    render json: { message: 'Project created successfully' }, status: :ok
                else
                    render json: { error: 'Failed to create the project' }, status: :unprocessable_entity
                end
              rescue => e
                render_api_error(e.message, :internal_server_error)
            end
         
      end
      
        def free_project_update
            begin
              if @free_project.update(free_project_params)
              
                render json: { message: 'Project updated successfully' }, status: :ok
              else
                render json: { error: 'Failed to update the project' }, status: :unprocessable_entity
            
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
                end
                rescue => e
                    render_api_error(e.message, :internal_server_error)
                
            end
          
          
        end

        

      def paid_project_index
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
          paid_project = current_organization.paid_projects.create(paid_project_params)
          
          if paid_project.save
              render json: { message: 'Project created successfully' }, status: :ok
          else
              render json: { error: 'Failed to create the project' }, status: :unprocessable_entity
          end
        rescue => e
          render_api_error(e.message, :internal_server_error)
        end
      end
          
      def paid_project_update
                begin
                  if @paid_project.update(paid_project_params)
                  
                    render json: { message: 'Project updated successfully' }, status: :ok
                  else
                    render json: { error: 'Failed to update the project' }, status: :unprocessable_entity
                
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
                        
                    end
                    rescue => e
                        render_api_error(e.message, :internal_server_error)
                end
              
              
      end
      def member_index
        begin
          @member=Member.all
          render json:@member
        rescue => e
            render_api_error(e.message, :internal_server_error)
        end
      end
      def member_show
        begin
          render json:@member
        rescue => e
            render_api_error(e.message, :internal_server_error)
        end
      
      end
      
      def member_create
        
            begin
                member = current_organization.members.create(member_params)
                
                if member.save
                    render json: { message: 'Member created successfully' }, status: :ok
                else
                    render json: { error: 'Failed to create the member' }, status: :unprocessable_entity
                end
              rescue => e
                render_api_error(e.message, :internal_server_error)
            end
         
      end
      
        def member_update
            begin
              if @member.update(member_params)
              
                render json: { message: 'Member updated successfully' }, status: :ok
              else
                render json: { error: 'Failed to update the member' }, status: :unprocessable_entity
            
              end
            rescue => e
                render_api_error(e.message, :internal_server_error)

            end
        end
              
            
        def member_destroy
            begin
                if  @member.destroy
                    render json: { message: 'Member deleted successfully' }, status: :ok
                else
                    render json: { error: 'Failed to delete the member' }, status: :unprocessable_entity
                end
                rescue => e
                    render_api_error(e.message, :internal_server_error)
                
            end
          
          
        end
        def task_index
          begin
            @task=Task.all
            render json:@task
          rescue => e
              render_api_error(e.message, :internal_server_error)
          end
        end
        def task_show
          begin
            render json:@task
          rescue => e
              render_api_error(e.message, :internal_server_error)
          end
        
        end
        def task_create
        
          begin
              task = current_organization.tasks.create(task_params)
              
              if task.save
                  render json: { message: 'Task created successfully' }, status: :ok
              else
                  render json: { error: 'Failed to create the task' }, status: :unprocessable_entity
              end
            rescue => e
              render_api_error(e.message, :internal_server_error)
          end
       
        end
      
      
      private 
      def add_member
          @member=Member.find(params[:id])
         
         
      end
      def member_params
          params.require(:member).permit([
              :email,
              :password,
              :confirm_password,
              :name,
              :plan
            
          ])
      end
      def add_free_project
          @free_project=FreeProject.find(params[:id])
         
         
      end
      def free_project_params
          params.require(:free_project).permit([
              :project_name,
              :start_date,
              :completion_date
            
          ])
      end
    def add_paid_project
                @paid_project=PaidProject.find(params[:id])
               
               
    end
    def paid_project_params
                params.require(:paid_project).permit([
                    :project_name,
                    :start_date,
                    :completion_date
                  
                ])
    end
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