module SeedModel
  def self.seed
    ['R8','S500','540I','RX300','Navigator','Taurus','Doblo','Viper'].each do |model|
    	brand = Brand.all.shuffle.first
      model = Model.find_or_create_by(name: model, brand_name: brand.name)
    end
  end
end