class Car < Product
  CATEGORY = 1
  attr_accessible :name, :description, :category_id, :condition, :type_product, :brand, :model, :year, :color,
                  :color, :plate_number, :exp_date, :kilometer, :door, :seat, :transmission, :engine,:price,
                  :cyclinders, :fuel, :location, :city, :province, :images_attributes,:status,:negotiable,:user_id,
                  :advertise_attributes

  has_one :advertise, foreign_key: 'product_id'

  accepts_nested_attributes_for :advertise, reject_if: :all_blank, allow_destroy: true

  default_scope { where(category_id: CATEGORY) }

end
