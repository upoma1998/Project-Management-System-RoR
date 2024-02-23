class AdminSerializer
    include JSONAPI::Serializer
    has_many :organization
    attributes :id, :email, :password, :confirm_password, :username, :created_at
    
end