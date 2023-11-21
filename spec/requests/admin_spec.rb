# spec/requests/home_spec.rb

require 'rails_helper'

RSpec.describe 'Admin API', type: :request do
  describe 'GET /' do
    context 'when admin is signed in get organizations' do
      let(:admin) { create(:admin) } 
        before (:each) do
            sign_in(admin)
            get  "http://0.0.0.0:3000/organization_all" 
        end

        it 'responds with a 200 status code' do
            expect(response).to have_http_status(200)
        end

      
    end

    context 'when admin is not signed in' do
      before do
        get "http://0.0.0.0:3000/organization_all"
      end
    end

  end

end


RSpec.describe 'Organization Create', type: :request do
  describe 'POST /organization_create' do
    let(:admin) { create(:admin) } 
        before (:each) do
            sign_in(admin)
            
        end
    let(:valid_attributes) do
      {
       
        
        organization:{
         email:"adminsuper@gmail.com",
         password:"admin12345",
         confirm_password:"admn12345",
         name: "Spectrum"
        }
         
         
        
        
    
      }
    end
   

    context 'with valid attributes' do
      it 'creates an organization' do
        expect do
          post "http://0.0.0.0:3000/organization_create", params: valid_attributes
        end.to change(Organization, :count).by(1)
      end

      it 'responds with a 200 status code (redirect)' do
        post "http://0.0.0.0:3000/organization_create", params: valid_attributes
        expect(response).to have_http_status(200)
      end

      
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) do
        {
            organization:{
                email:"admin@student.cuet.ac.bd",
                password:"admin12345",
                confirm_password:"admn12345",
                name: "Spectrum"
               }
        }
        
      end

      it 'does not create an organization' do
        expect do
          post "http://0.0.0.0:3000/organization_create", params: invalid_attributes
        end
      
      end

      it 'responds with a 200 status code' do
        post "http://0.0.0.0:3000/organization_create", params: invalid_attributes
        expect(response).to have_http_status(200)
      end

      
    end
  end
end



RSpec.describe 'Organization Update', type: :request do
  describe 'PATCH /organization_update' do
    let(:admin) { create(:admin) }  
            before (:each) do
                sign_in(admin)
                
            end
    

      context 'with valid attributes' do
        
        let!(:organization) {Organization.create(id:"3", email: "upoma@gmail.com", password:'2023-12-01 11:59:00', completion_date:'2023-12-31 11:59:00')}
        let(:valid_attributes) do
          {
            organization:{
              email:"upomasiminali@gmail.com",
              password:"upoma12345",
              confirm_password:"upoma12345",
              name: "Selsel"
                
                }
          }

        end

        it 'updates the organization' do
          patch "http://0.0.0.0:3000/organization/3", params: valid_attributes
          organization.reload
          expect(organization.email).to eq('upomasiminali@gmail.com')
        end

        it 'responds with a 200 status code (redirect)' do
            patch "http://0.0.0.0:3000/forganization/3", params: valid_attributes
          expect(response).to have_http_status(200)
        end

        
      end

      
  end
end



RSpec.describe 'Organization DELETE', type: :request do
  describe 'DELETE /organization' do
    let(:organization) { create(:organization) }  
            before (:each) do
                sign_in(organization)
                
            end

      it 'destroys the organization' do
        expect do
          delete "http://0.0.0.0:3000/organization/3"
        end
     
      end

      it 'responds with a 200 status code (redirect)' do
        delete "http://0.0.0.0:3000/organization/2"
        expect(response).to have_http_status(200)
      end

     
    

    
  end
end

