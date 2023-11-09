require 'rails_helper'

RSpec.describe Admin, type: :model do
  context 'when creating a admin' do
    let(:admin) { build :admin}
    let(:admin2) {build :admin,email:admin.email}
    it 'should have valid admin with all attributes' do
      admin.valid? == true
    end
    it 'should have valid email' do
      expect(admin.email).to include('@','.')
    end
    it 'should raise duplicate email error' do
     
      admin.save
      expect(admin2.save).to eq(false)
      
     
    end
    

    
  end
  
end
