class OrganizationSerializer
  include JSONAPI::Serializer
  has_many :free_projects
  has_many :paid_projects
  
  attributes :id, :email, :password, :confirm_password, :name, :created_at
  
end
