require 'rails_helper'

RSpec.describe Member, type: :model do
  context 'when creating a member' do
    let(:member) { build :member}
    let(:member2) {build :member,email:member.email}
    it 'should have valid member with all attributes' do
      member.valid? == true
    end
    it 'should have valid email' do
      expect(member.email).to include('@','.')
    end
    it 'should raise duplicate email error' do
     
      member.save
      expect(member2.save).to eq(false)
      
     
    end
    

    
  end
  
end
