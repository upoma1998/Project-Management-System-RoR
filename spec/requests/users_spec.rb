require 'rails_helper'
RSpec.describe 'Users API',type: :request do
        let(:user) {create :user}
        before(:each) do
            sign_in(user)
        end

    it 'return all users' do
        get '/users'
        expect(response).to have_http_status(:success)
        #expect(JSON.parse(response.body).size).to eq(7)
    end

    describe 'POST /users' do
        it 'creates a new user' do
            expect{
                post '/users',params:{
               user:{
                email:"saima@gmail.com",
                password:"saima1234"
               } 
            }
        }.to change {User.count}
            expect(response).to have_http_status(:ok)
        end
    end
    describe 'UPDATE /users' do
        it 'updates a user' do
            expect{
                update '/users/2',params:{
               user:{
                email:"mina@gmail.com",
                password:"mina1234"
               } 
            }
        }
        expect(response).to have_http_status(:success)
        end
    end
    describe 'DELETE /users' do
        it 'deletes a book' do
            delete '/users/5'
        
        expect(response).to have_http_status(:no_content)
        end
    end
end