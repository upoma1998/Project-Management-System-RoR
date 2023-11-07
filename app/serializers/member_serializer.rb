class MemberSerializer
    include JSONAPI::Serializer
    has_many :tasks
    attributes :id, :email, :password, :confirm_password, :first_name, :created_at
    
end