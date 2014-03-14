class Admin < Operator
  ROLE_ID = 1
  # Include default devise modules. Others available are:
  # :confirmable, and :omniauthable
  devise :database_authenticatable, :lockable, :timeoutable, 
         :recoverable, :rememberable, :trackable, :validatable
  
  default_scope { where(role_id: ROLE_ID) }

end
