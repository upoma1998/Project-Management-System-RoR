require "rails_helper"
RSpec.describe MemberController, type: :controller do
    let(:member) {create :member}
    before(:each) do
        sign_in(member)
    end
        #we need to first sign up the user
        describe 'GET assign_task_view' do
            let(:task){create :task}
            it 'assigns @assign_task_view' do
            
               
               
               get :assign_task_view
             
               expect(assigns(:task)).to eq([task])
    
            end
        end 
    
  end