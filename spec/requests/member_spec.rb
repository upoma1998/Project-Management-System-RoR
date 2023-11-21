# spec/requests/home_spec.rb

require 'rails_helper'

RSpec.describe 'Members API', type: :request do
  describe 'GET /' do
    context 'when member is signed in get tasks' do
      let(:member) { create(:member) } 
        before (:each) do
            sign_in(member)
            get  "http://0.0.0.0:3000/task_index_mem" 
        end

        it 'responds with a 200 status code' do
            expect(response).to have_http_status(200)
        end

      
    end

    context 'when member is not signed in' do
      before do
        get "http://0.0.0.0:3000/task_index_mem"
      end
    end

  end

end


RSpec.describe 'Task Create', type: :request do
  describe 'POST /task_create' do
    let(:member) { create(:member) } 
        before (:each) do
            sign_in(member)
            
        end
    let(:valid_attributes) do
      {
       
        task:{
            assigned_task:"Design and Development Phase-2",
            total_time:"1 week",
            completed_task:"Design",
            incomplete_task:"Development",
            time_needed:"3 days",
            dependency_on_member_name:"jisha",
            status: "incomplete"
        
        }
      }
    end
   

    context 'with valid attributes' do
      it 'creates a member' do
        expect do
          post "http://0.0.0.0:3000/task_create_mem", params: valid_attributes
        end.to change(Task, :count).by(1)
      end

      it 'responds with a 200 status code (redirect)' do
        post "http://0.0.0.0:3000/task_create_mem", params: valid_attributes
        expect(response).to have_http_status(200)
      end

      
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) do
        {
            task:{
            assigned_task:"Design and Development Phase-2",
            total_time:7,
            completed_task:"Design",
            incomplete_task:"Development",
            time_needed:"3 days",
            dependency_on_member_name:"jisha",
            status: "incomplete"
        
        }
        }
      end

      it 'does not create a task' do
        expect do
          post "http://0.0.0.0:3000/task_create_mem", params: invalid_attributes
        end
      end

      it 'responds with a 200 status code' do
        post "http://0.0.0.0:3000/task_create_mem", params: invalid_attributes
        expect(response).to have_http_status(200)
      end

      
    end
  end
end



RSpec.describe 'Task Update', type: :request do
  describe 'PATCH /task_update' do
    let(:member) { create(:member) }  
            before (:each) do
                sign_in(member)
                
            end
    

      context 'with valid attributes' do
        
        let!(:task) {Task.create(id:"1", assigned_task: "Deployy", total_time:"7",  completed_task:"Design",
        incomplete_task:"Development", time_needed:"3 days",  dependency_on_member_name:"jisha", status: "incomplete")}
        let(:valid_attributes) do
          {
            task:{
                assigned_task:"Deployment",
                total_time:"7",
                completed_task:"Design",
                incomplete_task:"Development",
                time_needed:"3 days",
                dependency_on_member_name:"jisha",
                status: "incomplete"
            
            }
                
          
          }

        end

        it 'updates the task' do
          patch "http://0.0.0.0:3000/task_update/1", params: valid_attributes
          task.reload
          expect(task.assigned_task).to eq('Deployment')
        end

        it 'responds with a 200 status code (redirect)' do
            patch "http://0.0.0.0:3000/task_update/1", params: valid_attributes
          expect(response).to have_http_status(200)
        end

        
      end

      
  end
end



RSpec.describe 'Task DELETE', type: :request do
  describe 'DELETE /task' do
    let(:member) { create(:member) }  
            before (:each) do
                sign_in(member)
                
            end

      it 'destroys the task' do
        expect do
          delete "http://0.0.0.0:3000/task_delete/1"
        end
      end

      it 'responds with a 200 status code (redirect)' do
        delete "http://0.0.0.0:3000/task_delete/1"
        expect(response).to have_http_status(200)
      end

     
    

    
  end
end

