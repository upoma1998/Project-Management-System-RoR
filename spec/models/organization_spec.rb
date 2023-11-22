require 'rails_helper'

RSpec.describe Organization, type: :model do
  
  it 'validates the presence of email' do
    organization = Organization.new(email: nil, password: 'password', confirm_password: 'password', name: 'Cloudly')

    expect(organization).not_to be_valid
    expect(organization.errors[:email]).to include("can't be blank")
  end
  it 'validates the uniqueness of email' do
    organization = create(:organization, email: 'orga@egmail.com')

    organization = Organization.new(email: 'orga@egmail.com', password: 'password', confirm_password: 'password', name: 'Cloudly')
    expect(organization).not_to be_valid
    expect(organization.errors[:email]).to include('has already been taken')
  end
  it 'validates the presence of password' do
    organization = Organization.new(email: 'upoma@gmail.com', password: nil, confirm_password: 'password', name: 'Cloudly')

    expect(organization).not_to be_valid
    expect(organization.errors[:password]).to include("can't be blank")
  end
  it 'validates minimum length of the password' do
    organization = Organization.new(email: 'upoma@gmail.com', password: 'pass', confirm_password: 'pass', name: 'Cloudly')

    expect(organization).not_to be_valid
    expect(organization.errors[:password]).to include('is too short (minimum is 8 characters)')

    organization.password = 'password'
    expect(organization).to be_valid
  end
  it 'validates the presence of confirm_password' do
    organization = Organization.new(email: 'upoma@gmail.com', password: 'password', confirm_password: nil, name: 'Cloudly')

    expect(organization).not_to be_valid
    expect(organization.errors[:confirm_password]).to include("can't be blank")
  end
  it 'validates the confirmation of password' do
    organization = Organization.new(email: 'orga@gmail.com', password: 'password', confirm_password: 'password', name:'Cloudly')
    expect(organization).to be_valid
  end
  it 'validates the presence of name' do
    organization = Organization.new(email: 'upoma@gmail.com', password: 'password', confirm_password: 'password', name: nil)

    expect(organization).not_to be_valid
    expect(organization.errors[:name]).to include("can't be blank")
  end
  it 'validates the format of the email' do
      organization = Organization.new(email: 'upoma.com', password: 'password', confirm_password: 'password', name: 'Cloudly')
  
      expect(organization).not_to be_valid
      expect(organization.errors[:email]).to include("must be a valid email address")
  
      organization.email = 'upoma@gmail.com'
      expect(organization).to be_valid
  end
  it 'has many free_projects' do
    organization = create(:organization)
    free_project1 = create(:free_project, organization: organization)
    free_project2 = create(:free_project, organization: organization)

    expect(organization.free_projects).to include(free_project1, free_project2)
  end

  it 'destroys associated posts when user is destroyed' do
    organization = create(:organization)
    free_project = create(:free_project, organization: organization)

    expect { organization.destroy }.to change(FreeProject, :count).by(-1)
  end

  
end
