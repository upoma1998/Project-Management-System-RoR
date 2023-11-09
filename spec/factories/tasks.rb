FactoryBot.define do
  factory :task do
   
    assigned_task {Faker::Internet.email}
    completed_task{Faker::Name.name_with_middle}
    total_time{'7 days'}
    incomplete_task{Faker::Name.name_with_middle}
    time_needed{'7 days'}
    dependency_on_member_name{Faker::Name.name_with_middle}
    status{Faker::Name.name_with_middle}
   
  end
end
