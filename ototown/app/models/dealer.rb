class Dealer < Operator
  ROLE_ID = 3

  attr_accessible :email, :username, :password, :password_confirmation, :profile_attributes, 
                  :dealer_info_attributes, :role_id
  # Include default devise modules. Others available are:
  # :confirmable, and :omniauthable
  devise :database_authenticatable, :lockable, :timeoutable, 
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, foreign_key: 'user_id', :dependent => :destroy 
  has_one :dealer_info, :dependent => :destroy 
  accepts_nested_attributes_for :profile, reject_if: :all_blank
  accepts_nested_attributes_for :dealer_info, reject_if: :all_blank

  after_initialize :after_initialized

  default_scope { where(role_id: ROLE_ID) }

  protected
    def after_initialized
      self.profile = Profile.new if self.profile.blank?
      self.dealer_info = DealerInfo.new if self.dealer_info.blank?
    end
  
end
