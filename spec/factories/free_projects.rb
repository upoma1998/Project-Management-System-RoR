FactoryBot.define do
  factory :free_project do
    project_name { "MyString" }
    start_date { "2023-10-19 17:09:20" }
    completion_date { "2023-10-19 17:09:20" }
    user { nil }
  end
end
