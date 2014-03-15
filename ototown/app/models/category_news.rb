class CategoryNews < ActiveRecord::Base
  attr_accessible :title
  has_many :news, foreign_key: 'category_id'
end
