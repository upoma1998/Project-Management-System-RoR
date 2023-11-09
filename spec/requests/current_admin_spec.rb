require 'rails_helper'
RSpec.describe "CurrentAdmins", type: :request do
        let(:admin) {create :admin}
        before(:each) do
            sign_in(admin)
        end

    it 'return all admins' do
        get '/admins'
        expect(response).to have_http_status(:success)
        #expect(JSON.parse(response.body).size).to eq(7)
    end

    describe 'POST /admins' do
        it 'creates a new admin' do
            expect{
                post '/admins',params:{
               user:{
                email:"saima@gmail.com",
                password:"saima1234"
               } 
            }
        }.to change {Admin.count}
            expect(response).to have_http_status(:ok)
        end
    end
    describe 'UPDATE /admins' do
        it 'updates a admin' do
            expect{
                update '/admins/2',params:{
               user:{
                email:"mina@gmail.com",
                password:"mina1234"
               } 
            }
        }
        expect(response).to have_http_status(:success)
        end
    end
    describe 'DELETE /admins' do
        it 'deletes an admin' do
            delete '/admins/5'
        
        expect(response).to have_http_status(:no_content)
        end
    end
end