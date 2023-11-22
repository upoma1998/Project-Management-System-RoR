require 'rails_helper'

RSpec.describe Member, type: :model do
  
  it 'validates the presence of email' do
    member = Member.new(email: nil, password: 'password', confirm_password: 'password', first_name: 'member')


    expect(member).not_to be_valid
    expect(member.errors[:email]).to include("can't be blank")
  end
  it 'validates the uniqueness of email' do
    member = create(:member, email: 'member@gmail.com')

    member = Member.new(email: 'member@gmail.com', password: 'password', confirm_password: 'password', first_name: 'member')
    expect(member).not_to be_valid
    expect(member.errors[:email]).to include('has already been taken')
  end
  it 'validates the presence of password' do
    member = Member.new(email: 'member@gmail.com', password: nil, confirm_password: 'password', first_name: 'member')

    expect(member).not_to be_valid
    expect(member.errors[:password]).to include("can't be blank")
  end
  it 'validates minimum length of the password' do
    member = Member.new(email: 'member@gmail.com', password: 'pass', confirm_password: 'pass', first_name: 'member')

    expect(member).not_to be_valid
    expect(member.errors[:password]).to include('is too short (minimum is 8 characters)')

    member.password = 'password'
    expect(member).to be_valid
  end
  it 'validates the presence of confirm_password' do
    member = Member.new(email: 'member@gmail.com', password: 'password', confirm_password: nil, first_name: 'member')

    expect(member).not_to be_valid
    expect(member.errors[:confirm_password]).to include("can't be blank")
  end
  it 'validates the confirmation of password' do
    member = Member.new(email: 'member@gmail.com', password: 'password', confirm_password: 'password', first_name: 'member')
    expect(member).to be_valid
  end
  it 'validates the presence of first_name' do
    member = Member.new(email: 'member@gmail.com', password: 'password', confirm_password: 'password', first_name: nil)

    expect(member).not_to be_valid
    expect(member.errors[:first_name]).to include("can't be blank")
  end
  it 'validates the format of the email' do
      member = Member.new(email: 'member.com', password: 'password', confirm_password: 'password', first_name: 'member')
  
      expect(member).not_to be_valid
      expect(member.errors[:email]).to include("must be a valid email address")
  
      member.email = 'member@gmail.com'
      expect(member).to be_valid
  end
  it 'has many tasks' do
    member = create(:member)
    task1 = create(:task, member: member)
    task2 = create(:task, member: member)

    expect(member.tasks).to include(task1, task2)
  end

  it 'destroys associated posts when user is destroyed' do
    member = create(:member)
    task = create(:task, member: member)

    expect { member.destroy }.to change(Task, :count).by(-1)
  end


  
  
end
