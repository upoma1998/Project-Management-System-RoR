FactoryBot.define do
  factory :paid_project do
    project_name { Faker::Name.name_with_middle }
    start_date { "2023-10-17 12:42:08" }
    completion_date { "2023-10-17 12:42:08" }
    user { nil }
  end
end
