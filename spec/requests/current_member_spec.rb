require 'rails_helper'
RSpec.describe "CurrentMembers", type: :request do
        let(:member) {create :member}
        before(:each) do
            sign_in(member)
        end

    it 'return all members' do
        get '/members'
        expect(response).to have_http_status(:success)
        #expect(JSON.parse(response.body).size).to eq(7)
    end

    describe 'POST /members' do
        it 'creates a new member' do
            expect{
                post '/members',params:{
               user:{
                email:"saima@gmail.com",
                password:"saima1234",
                confirm_password:"saima1234",
                first_name:"saima"
               } 
            }
        }.to change {Member.count}
            expect(response).to have_http_status(:ok)
        end
    end
    describe 'UPDATE /members' do
        it 'updates a member' do
            expect{
                update '/members/2',params:{
               user:{
                email:"mina@gmail.com",
                password:"mina1234",
                confirm_password:"saima1234",
                first_name:"saima"
               } 
            }
        }
        expect(response).to have_http_status(:success)
        end
    end
    describe 'DELETE /members' do
        it 'deletes an admin' do
            delete '/members/5'
        
        expect(response).to have_http_status(:no_content)
        end
    end
end