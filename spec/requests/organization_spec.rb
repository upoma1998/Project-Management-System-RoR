# spec/requests/home_spec.rb

require 'rails_helper'

RSpec.describe 'Organizations API', type: :request do
  describe 'GET /' do
    context 'when organization is signed in get free projects' do
      let(:organization) { create(:organization) } 
        before (:each) do
            sign_in(organization)
            get  "http://0.0.0.0:3000/free_project_all" 
        end

        it 'responds with a 200 status code' do
            expect(response).to have_http_status(200)
        end

      
    end

    context 'when organization is not signed in' do
      before do
        get "http://0.0.0.0:3000/free_project_all"
      end
    end

  end

end


RSpec.describe 'Free Project Create', type: :request do
  describe 'POST /free_project_create' do
    let(:organization) { create(:organization) } 
        before (:each) do
            sign_in(organization)
            
        end
    let(:valid_attributes) do
      {
       
        free_project:{
        project_name:'Devssssss-1.2',
        start_date:'2023-11-17 11:59:00',
        completion_date:'2023-11-30 11:59:00'
        
        }
      }
    end
   

    context 'with valid attributes' do
      it 'creates a free_project' do
        expect do
          post "http://0.0.0.0:3000/free_project_create", params: valid_attributes
        end.to change(FreeProject, :count).by(1)
      end

      it 'responds with a 200 status code (redirect)' do
        post "http://0.0.0.0:3000/free_project_create", params: valid_attributes
        expect(response).to have_http_status(200)
      end

      
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) do
        {
            free_project:{
                project_name:'Devssssss-1.2',
                start_date:'monday',
                completion_date:'2023-11-30 11:59:00'
                
                }
        }
      end

      it 'does not create a free_project' do
        expect do
          post "http://0.0.0.0:3000/free_project_create", params: invalid_attributes
        end
      end

      it 'responds with a 200 status code' do
        post "http://0.0.0.0:3000/free_project_create", params: invalid_attributes
        expect(response).to have_http_status(200)
      end

      
    end
  end
end



RSpec.describe 'Free Project Update', type: :request do
  describe 'PATCH /free_project_update' do
    let(:organization) { create(:organization) }  
            before (:each) do
                sign_in(organization)
                
            end
    

      context 'with valid attributes' do
        
        let!(:free_project) {FreeProject.create(id:"3", project_name: "Devops", start_date:'2023-12-01 11:59:00', completion_date:'2023-12-31 11:59:00')}
        let(:valid_attributes) do
          {
            free_project:{
                project_name:'Testing',
                start_date:'2023-12-01 11:59:00',
                completion_date:'2023-12-31 11:59:00'
                
                }
          }

        end

        it 'updates the free_project' do
          patch "http://0.0.0.0:3000/free_project/3", params: valid_attributes
          free_project.reload
          expect(free_project.project_name).to eq('Testing')
        end

        it 'responds with a 200 status code (redirect)' do
            patch "http://0.0.0.0:3000/free_project/3", params: valid_attributes
          expect(response).to have_http_status(200)
        end

        
      end

      
  end
end



RSpec.describe 'Free Project DELETE', type: :request do
  describe 'DELETE /free_project' do
    let(:organization) { create(:organization) }  
            before (:each) do
                sign_in(organization)
                
            end

      it 'destroys the free project' do
        expect do
          delete "http://0.0.0.0:3000/free_project/5"
        end.to change(FreeProject, :count).by(-1)
      end

      it 'responds with a 200 status code (redirect)' do
        delete "http://0.0.0.0:3000/free_project/5"
        expect(response).to have_http_status(200)
      end

     
    

    
  end
end

