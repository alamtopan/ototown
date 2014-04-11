module SeedModel
  def self.seed
    ['R8','S500','540I','RX300','Navigator','Taurus','Doblo','Viper'].each do |model|
      model = Model.find_or_create_by_name(model)
    end
  end
end