require 'rails_helper'

RSpec.describe Organization, type: :model do
  context 'when creating a organization' do
    let(:organization) { build :organization}
    let(:organization2) {build :organization,email:organization.email}
    it 'should have valid organization with all attributes' do
      organization.valid? == true
    end
    it 'should have valid email' do
      expect(organization.email).to include('@','.')
    end
    it 'should raise duplicate email error' do
     
      organization.save
      expect(organization2.save).to eq(false)
      
     
    end
    

    
  end
  
end
