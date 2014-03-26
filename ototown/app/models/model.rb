class Model < ActiveRecord::Base
  attr_accessible :name, :brand_id
  belongs_to :brand
end
