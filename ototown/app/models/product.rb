class Product < ActiveRecord::Base
  attr_accessible :name, :description, :category_id, :condition, :type_product, :brand, :model, :year, :color,
                  :color, :plate_number, :exp_date, :kilometer, :door, :seat, :transmission, :engine,
                  :cyclinders, :fuel, :location
  belongs_to :category
  has_one :advertise
  has_many :image_products
end
