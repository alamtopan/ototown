class Dealer < Operator
  ROLE_ID = 3

  attr_accessible :username, :password, :email
  # Include default devise modules. Others available are:
  # :confirmable, and :omniauthable
  devise :database_authenticatable, :lockable, :timeoutable, 
         :recoverable, :rememberable, :trackable, :validatable

  has_one :dealer_info, :dependent => :destroy 
  has_one :profile, :dependent => :destroy 
  accepts_nested_attributes_for :profile, :allow_destroy => true


  default_scope { where(role_id: ROLE_ID) }
  
end
