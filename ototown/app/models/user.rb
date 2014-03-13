class User < Operator
  ROLE_ID = 2

  # Include default devise modules. Others available are:
  # :confirmable, and :omniauthable
  # devise :database_authenticatable, :lockable, :timeoutable, 
  #        :recoverable, :rememberable, :trackable, :validatable

  default_scope where(role_id: ROLE_ID)
  
end
