FactoryBot.define do
  factory :admin do
   
    email {Faker::Internet.email}
    password {'password@123'}
    confirm_password{'password@123'}
    username {Faker::Name.name_with_middle}
   # plan {Faker::Name.name_with_middle}
    

  end
end
