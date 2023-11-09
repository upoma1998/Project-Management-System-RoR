FactoryBot.define do
  factory :free_project do
    project_name { Faker::Name.name_with_middle }
    start_date { "2023-10-19 17:09:20" }
    completion_date { "2023-10-19 17:09:20" }
    #organization { nil }
  end
end

