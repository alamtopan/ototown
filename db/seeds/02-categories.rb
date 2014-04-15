module SeedCategory
  def self.seed
    ['Car','Sparepart'].each do |cate|
      category = Category.find_or_create_by_name(cate)
    end
  end
end