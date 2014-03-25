module SeedBrand
  def self.seed
    ['Audi','Mercedez-Benz','BMW','Lexus','Lincoln','Ford','Fiat','Dodge'].each do |brand|
      brand = Brand.find_or_create_by_name(brand)
    end
  end
end