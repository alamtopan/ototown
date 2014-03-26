class Model < ActiveRecord::Base
  attr_accessible :name, :brand_name
  belongs_to :brand
end
