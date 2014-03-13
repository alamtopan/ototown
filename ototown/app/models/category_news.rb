class CategoryNews < ActiveRecord::Base
  has_many :news, foreign_key: 'category_id'
end
