class AdminSerializer
    include JSONAPI::Serializer
  
    attributes :id, :email, :password, :confirm_password, :username, :created_at
    
end