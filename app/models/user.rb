class User < ApplicationRecord
  
 
  include Devise::JWT::RevocationStrategies::JTIMatcher
  
  #validates :email,presence: true,uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #devise :database_authenticatable, :registerable,
         #:recoverable, :rememberable, :validatable,
        # :jwt_authenticatable, jwt_revocation_strategy: self
  
  #has_many :paid_projects, dependent: :destroy
  #has_many :free_projects, dependent: :destroy
  #ROLES=%w{super_admin organization member}
  #def jwt_payload
          #super
  #end
  #ROLES.each do |role_name|
    #define_method "#{role_name}?" do
     #ole==role_name
    #end
  #end
  

end
