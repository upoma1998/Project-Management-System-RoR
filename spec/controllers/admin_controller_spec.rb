require "rails_helper"
RSpec.describe AdminController, type: :controller do
    let(:admin) {create :admin}
    before(:each) do
        sign_in(admin)
    end
        #we need to first sign up the user
        describe 'GET organization_index' do
            let(:organization){create :organization}
            it 'assigns @organization' do
            
               
               
               get :organization_index
             
               expect(assigns(:organization)).to eq([organization])
    
            end
        end 
    
  end