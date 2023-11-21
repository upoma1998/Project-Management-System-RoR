class AdminController < ApplicationController
    before_action :authenticate_admin!
    before_action :add_orga, only: [:organization_show, :organization_destroy, :organization_update]
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
              if @organization.update(orga_params)
              
                render json: { message: 'Organization updated successfully' }, status: :ok
              else
                render json: { error: 'Failed to update the organization' }, status: :unprocessable_entity
            
              end
            rescue => e
                render_api_error(e.message, :internal_server_error)

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
           
end
