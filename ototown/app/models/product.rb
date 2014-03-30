class Product < ActiveRecord::Base
  attr_accessible :name, :description, :category_id, :condition, :type_product, :brand, :model, :year, :color,
                  :color, :plate_number, :exp_date, :kilometer, :door, :seat, :transmission, :engine,:price,
                  :cyclinders, :fuel, :location, :city, :province, :images_attributes, :user_id,:status,:negotiable
  belongs_to :category
  belongs_to :user
  has_one :advertise
  has_many :images, class_name: 'ImageProduct', dependent: :destroy
  
  accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true

  validates :name, :category_id, :condition, :user_id, presence: true

end
