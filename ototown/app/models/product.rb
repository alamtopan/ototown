class Product < ActiveRecord::Base
  attr_accessible :name, :description, :category_id, :condition, :type_product, :brand, :model, :year, :color,
                  :color, :plate_number, :exp_date, :kilometer, :door, :seat, :transmission, :engine,
                  :cyclinders, :fuel, :location, :city, :province, :images_attributes, :user_id
  belongs_to :category
  belongs_to :user
  has_one :advertise
  has_many :images, class_name: 'ImageProduct'
  
  accepts_nested_attributes_for :images, :reject_if => :all_blank, :allow_destroy => true

end
