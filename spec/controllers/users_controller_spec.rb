require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    #we need to first sign up the user
    describe 'GET index' do
        let(:user){create :user}
        it 'assigns @users' do
        
           #user=User.create
           sign_in(user)
           get :index
           #debugger
           expect(assigns(:user)).to eq([user])

        end
    end
    describe 'POST create' do
        let(:user) {create :user}
        before(:each) do
            sign_in(user)
        end
            it 'should accept the create new users' do
            post :create, params:{
                user:{
                    email:Faker::Internet.email,
                    password:'passwordupo@123'
                }
            }
            
            expect(response).to have_http_status(:created)
           
            end
        
     end


   
    
    
end