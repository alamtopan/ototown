class Dealer < User

  attr_accessible :email, :username, :password, :password_confirmation, :profile_attributes,
                  :dealer_info_attributes, :role_id, :images_attributes
  # Include default devise modules. Others available are:
  # :confirmable, and :omniauthable
  devise :database_authenticatable, :lockable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :images, class_name: 'ImageDealer', :dependent => :destroy
  has_one :profile, foreign_key: 'user_id', :dependent => :destroy
  has_one :dealer_info, :dependent => :destroy
  accepts_nested_attributes_for :profile, reject_if: :all_blank
  accepts_nested_attributes_for :dealer_info, reject_if: :all_blank
  accepts_nested_attributes_for :images, :reject_if => :all_blank, :allow_destroy => true

  after_initialize :after_initialized

  default_scope { includes(:dealer_info).where('dealer_infos.active = TRUE OR dealer_infos.active = false') }


  scope :filter_by_category_type, ->(category_type) do
            return if category_type.blank?
            where("dealer_infos.category_type = ?", category_type)
          end
  scope :filter_by_address, ->(address) do
            return if address.blank?
            where("dealer_infos.address LIKE ?", "%#{address}%")
          end
  scope :filter_by_title, ->(title) do
            return if title.blank?
            where("title LIKE ?", "%#{title}%")
          end


  scope :filter_search, ->(params) do
        return scoped if params.blank?

        filter_by_category_type(params[:category_type])
          .filter_by_title(params[:title])
          .filter_by_address(params[:address])

        end

  protected
    def after_initialized
      self.profile = Profile.new if self.profile.blank?
      self.dealer_info = DealerInfo.new(active: false) if self.dealer_info.blank?
    end

end
