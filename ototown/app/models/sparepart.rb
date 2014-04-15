class Sparepart < Product
  CATEGORY = 2
  attr_accessible :name, :description, :category_id, :condition, :type_product, :brand, :model, :year, :location, :city, :province, :images_attributes

  default_scope { where(category_id: CATEGORY) }

end
