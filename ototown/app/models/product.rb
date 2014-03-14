class Product < ActiveRecord::Base
  belongs_to :category
  has_one :advertise
  has_many :image_products
end
