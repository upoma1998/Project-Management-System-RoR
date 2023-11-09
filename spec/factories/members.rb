FactoryBot.define do
  factory :member do
    
    email {Faker::Internet.email}
    password {'password@123'}
    confirm_password{'password@123'}
    first_name {Faker::Name.name_with_middle}
  end
end
