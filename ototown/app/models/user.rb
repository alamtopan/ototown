class User < Operator
  ROLE_ID = 2

  # Include default devise modules. Others available are:
  # :confirmable, and :omniauthable
  devise :database_authenticatable, :lockable, :timeoutable, 
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, :dependent => :destroy 
  accepts_nested_attributes_for :profile, :allow_destroy => true

  has_attached_file :avatar, :styles => { 
                                          :medium => "300x300>", 
                                          :thumb => "100x100>" 
                                        }

  default_scope { where(role_id: ROLE_ID) }
  
end
