module SeedType
  def self.seed
    ['Sedan','Coupe','SUV','Hatchback'].each do |type|
      type = Type.find_or_create_by_name(type)
    end
  end
end