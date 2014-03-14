class News < ActiveRecord::Base
  belongs_to :category_news, foreign_key: 'category_id'
end
