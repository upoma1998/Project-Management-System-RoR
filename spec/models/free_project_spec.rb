require 'rails_helper'

RSpec.describe FreeProject, type: :model do

  it 'validates the presence of project_name' do
    free_project = FreeProject.new(project_name:nil, start_date:'22-11-23 11:59:00', completion_date:'22-12-23 11:59:00')


    expect(free_project).not_to be_valid
    expect(free_project.errors[:project_name]).to include("can't be blank")
  end
  it 'validates the uniqueness of project_name' do
    free_project = create(:free_project,project_name:'Devs-1')

    free_project = FreeProject.new(project_name:'Devs-1', start_date:'22-11-23 11:59:00', completion_date:'22-12-23 11:59:00')
    expect(free_project).not_to be_valid
    expect(free_project.errors[:project_name]).to include('has already been taken')
  end
  it 'validates the presence of start_date' do
    free_project = FreeProject.new(project_name:'Devs-1', start_date:nil, completion_date:'22-12-23 11:59:00')

    expect(free_project).not_to be_valid
    expect(free_project.errors[:start_date]).to include("can't be blank")
  end
  it 'validates the presence of completion_date' do
    free_project = FreeProject.new(project_name:'Devs-1', start_date:nil, completion_date: nil)

    expect(free_project).not_to be_valid
    expect(free_project.errors[:completion_date]).to include("can't be blank")
  end
end
