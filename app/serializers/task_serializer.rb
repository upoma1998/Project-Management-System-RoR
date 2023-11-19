class TaskSerializer
  include JSONAPI::Serializer
  belongs_to :member
  attributes :assigned_task, :total_time, :completed_task, :incomplete_task, :time_needed, :dependency_on_member_name, :status

 
end



