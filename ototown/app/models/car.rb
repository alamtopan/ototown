class Car < Product
  CATEGORY = 1
  attr_accessible :name, :description, :category_id, :condition, :type_product, :brand, :model, :year, :color,
                  :color, :plate_number, :exp_date, :kilometer, :door, :seat, :transmission, :engine,:price
                  :cyclinders, :fuel, :location, :city, :province, :images_attributes,:status,:negotiable,:user_id

  default_scope { where(category_id: CATEGORY) }

end
