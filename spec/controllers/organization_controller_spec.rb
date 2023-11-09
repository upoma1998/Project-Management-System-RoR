require "rails_helper"
RSpec.describe OrganizationController, type: :controller do
    let(:organization) {create :organization}
    before(:each) do
        sign_in(organization)
    end
        #we need to first sign up the user
        describe 'GET free_project_index' do
            let(:free_project){create :free_project}
            it 'assigns @free_projects' do
            
               
               
               get :free_project_index
             
               expect(assigns(:free_project)).to eq([free_project])
    
            end
        end 
    
  end