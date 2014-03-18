class User < Operator
  ROLE_ID = 2

  attr_accessible :email, :username, :password, :password_confirmation, :profile_attributes, :role_id
  devise :database_authenticatable, :lockable, :timeoutable, 
         :recoverable, :rememberable, :trackable, :validatable

  after_initialize :after_initialized

  has_one :profile, :dependent => :destroy 
  accepts_nested_attributes_for :profile, reject_if: :all_blank

  default_scope { where(role_id: ROLE_ID) }

  protected
    def after_initialized
      self.profile = Profile.new if self.profile.blank?
    end
  
end
