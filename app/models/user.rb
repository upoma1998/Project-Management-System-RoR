class User < ApplicationRecord
  
 
  include Devise::JWT::RevocationStrategies::JTIMatcher
  validates :password, presence: true
  validates :email,presence: true,uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self
  
  has_many :paid_projects, dependent: :destroy
  ROLES=%w{super_admin organization member}
  def jwt_payload
          super
  end
 # ROLES.each do |roles_name|
   # define_method "#{role_name}" do
     # role==role_name
    #end
  #end
  def super_admin?
    role=='super-admin'
  end

  def organization?
    role=='organization'
  end
  def member?
    role=='member'
  end

end
