class AdminController < ApplicationController
    before_action :authenticate_admin!
    before_action :add_orga, only: [:organization_show, :organization_destroy, :organization_update]
    before_action :add_free_project, only: [:free_project_show, :free_project_destroy, :free_project_update]
    before_action :add_paid_project, only: [:paid_project_show, :paid_project_destroy, :paid_project_update]
    before_action :add_task, only: [:task_index, :task_show]
    
    def organization_index
        begin
          @organization=Organization.all
          render json:@organization
        rescue => e
            render_api_error(e.message, :internal_server_error)
        end
    end
      def organization_show
        begin
          render json:@organization
        rescue => e
            render_api_error(e.message, :internal_server_error)
        end
      
      end
      
      def organization_create
        
        begin
          organization = current_admin.organization.create(orga_params)
          
          if organization.save
              render json: { message: 'Organization created successfully' }, status: :ok
          else
              render json: { error: 'Failed to create the organization' }, status: :unprocessable_entity
          end
          
        end
         
      end
      
        def organization_update
            begin
              # puts "=========================orga_params=======> #{orga_params}"
              if @organization.update(orga_params)
                
                render json: { message: 'Organization updated successfully' }, status: :ok
              else
                render json: { error: 'Failed to update the organization' }, status: :unprocessable_entity
            
              end
            rescue => e
                render_api_error("789", :internal_server_error)

            end
        end
              
            
        def organization_destroy
            begin
                if  @organization.destroy
                    render json: { message: 'Organization deleted successfully' }, status: :ok
                else
                    render json: { error: 'Failed to delete the organization' }, status: :unprocessable_entity
                end
                rescue => e
                    render_api_error(e.message, :internal_server_error)
                
            end
          
          
        end
        def destroy
          sign_out(admin)
          render json: { message: 'Signed out successfully' }, status: :ok
        end
        def free_project_show
          begin
            render json:@free_project
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
        def member_show
          begin
            render json:@member
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
        

      
      
      private 
      def add_orga
          @organization=Organization.find(params[:id])
         
         
      end
      def orga_params
          params.require(:organization).permit([
              :email,
              :password,
              :confirm_password,
              :name
          ])
      end
      def free_project_params
        params.require(:free_project).permit([
            :project_name,
            :start_date,
            :completion_date
          
        ])
      end
      def paid_project_params
      params.require(:paid_project).permit([
          :project_name,
          :start_date,
          :completion_date
        
      ])
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
      def member_params
        params.require(:member).permit([
            :email,
            :password,
            :confirm_password,
            :name,
            :plan
          
        ])
      end
end
