require 'rails_helper'
RSpec.describe 'Organizations API',type: :request do
        let(:organization) {create :organization}
        before(:each) do
            sign_in(organization)
        end

    it 'return all organizations' do
        get '/organizations'
        expect(response).to have_http_status(:success)
        #expect(JSON.parse(response.body).size).to eq(7)
    end

    describe 'POST /organizations' do
        it 'creates a new organization' do
            expect{
                post '/organizations',params:{
               user:{
                email:"saimaa@gmail.com",
                password:"saimaa1234",
                confirm_password:"saimaa1234",
                name:"saimaa"
               } 
            }
        }.to change {Organizations.count}
            expect(response).to have_http_status(:ok)
        end
    end
    describe 'UPDATE /organizations' do
        it 'updates a organization' do
            expect{
                update '/organizations/2',params:{
               user:{
                email:"mina@gmail.com",
                password:"mina1234",
                confirm_password:"saimaa1234",
                name:"saimaa"
               } 
            }
        }
        expect(response).to have_http_status(:success)
        end
    end
    describe 'DELETE /organizations' do
        it 'deletes an organization' do
            delete '/organizations/5'
        
        expect(response).to have_http_status(:no_content)
        end
    end
end