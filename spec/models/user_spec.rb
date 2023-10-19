require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when creating a user' do
    let(:user) { build :user}
    let(:user2) {build :user,email:user.email}
    it 'should have valid user with all attributes' do
      user.valid? == true
    end
    it 'should have valid email' do
      expect(user.email).to include('@','.')
    end
    it 'should raise duplicate email error' do
     
      user.save
      expect(user2.save).to eq(false)
      
     
    end
    

    
  end
  
end
