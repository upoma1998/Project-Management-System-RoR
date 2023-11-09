FactoryBot.define do
    factory :organization do
   
        email {Faker::Internet.email}
        password {'password@123'}
        confirm_password{'password@123'}
        name {Faker::Name.name_with_middle}
        
        
        
    
      end
    
  
end
