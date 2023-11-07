class PaidProjectSerializer
  include JSONAPI::Serializer
  belongs_to :organization
  attributes :project_name, :start_date, :completion_date
  
end
