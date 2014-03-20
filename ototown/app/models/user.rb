class User < Operator
  ROLE_ID = 2

  attr_accessible :email, :username, :password, :password_confirmation, :profile_attributes, :role_id
  
  devise :database_authenticatable, :lockable, :timeoutable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  after_initialize :after_initialized

  has_one :profile, :dependent => :destroy 
  accepts_nested_attributes_for :profile, reject_if: :all_blank

  default_scope { where(role_id: ROLE_ID) }

  class << self
    def find_for_facebook_oauth(auth)
      where(auth.slice(:provider, :uid)).first_or_create do |user|
          user.provider = auth.provider
          user.uid = auth.uid
          user.email = auth.info.email
          user.password = Devise.friendly_token[0,20]
          user.username = auth.info.nickname
      end
    end

    def new_with_session(params, session)
      super.tap do |user|
        if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
          user.email = data["email"] if user.email.blank?
        end
      end
    end

  end

  protected
    def after_initialized
      self.profile = Profile.new if self.profile.blank?
    end
  
end
