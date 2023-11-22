require 'rails_helper'

RSpec.describe Admin, type: :model do
  
  it 'validates the presence of email' do
    admin = Admin.new(email: nil, password: 'password', confirm_password: 'password', username: 'admin1998')


    expect(admin).not_to be_valid
    expect(admin.errors[:email]).to include("can't be blank")
  end
  it 'validates the uniqueness of email' do
    admin = create(:admin, email: 'admin@gmail.com')

    admin = Admin.new(email: 'admin@gmail.com', password: 'password', confirm_password: 'password', username: 'admin1998')
    expect(admin).not_to be_valid
    expect(admin.errors[:email]).to include('has already been taken')
  end
  it 'validates the presence of password' do
    admin = Admin.new(email: 'admin@gmail.com', password: nil, confirm_password: 'password', username: 'admin1998')

    expect(admin).not_to be_valid
    expect(admin.errors[:password]).to include("can't be blank")
  end
  it 'validates minimum length of the password' do
    admin = Admin.new(email: 'admin@gmail.com', password: 'pass', confirm_password: 'pass', username: 'admin1998')

    expect(admin).not_to be_valid
    expect(admin.errors[:password]).to include('is too short (minimum is 8 characters)')

    admin.password = 'password'
    expect(admin).to be_valid
  end
  it 'validates the presence of confirm_password' do
    admin = Admin.new(email: 'admin@gmail.com', password: 'password', confirm_password: nil, username: 'admin1998')

    expect(admin).not_to be_valid
    expect(admin.errors[:confirm_password]).to include("can't be blank")
  end
  it 'validates the confirmation of password' do
    admin = Admin.new(email: 'admin@gmail.com', password: 'password', confirm_password: 'password', username: 'admin1998')
    expect(admin).to be_valid
  end
  it 'validates the presence of username' do
    admin = Admin.new(email: 'admin@gmail.com', password: 'password', confirm_password: 'password', username: nil)

    expect(admin).not_to be_valid
    expect(admin.errors[:username]).to include("can't be blank")
  end
  it 'validates the format of the email' do
      admin = Admin.new(email: 'admin.com', password: 'password', confirm_password: 'password', username: 'admin1998')
  
      expect(admin).not_to be_valid
      expect(admin.errors[:email]).to include("must be a valid email address")
  
      admin.email = 'admin@gmail.com'
      expect(admin).to be_valid
  end
  

  
  
end
