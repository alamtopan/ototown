class Sparepart < Product
  CATEGORY = 2
  has_one :advertise
  has_many :image_products

  default_scope { where(category_id: CATEGORY) }

end
