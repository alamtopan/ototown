class News < ActiveRecord::Base
	attr_accessible :title, :content
  belongs_to :category_news, foreign_key: 'category_id'
end
