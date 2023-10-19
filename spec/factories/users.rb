FactoryBot.define do
  factory :user do
    email{Faker::Internet.email}
    password{'passwordupo@123'}
  end
end
