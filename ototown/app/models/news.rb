class News < ActiveRecord::Base
	attr_accessible :title, :content, :category_id, :pic, :publish, :unpublish
  belongs_to :category_news, foreign_key: 'category_id'

  has_attached_file :pic, styles:  { 
                                     :medium => "600x600>", 
                                     :thumb => "100x100>" 
                                    }, 
                                    :default_url => "/assets/no-image.jpg"
                                    
  validates_attachment :pic, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
  scope :published,  -> { where('(publish IS NULL OR unpublish IS NULL) OR (publish <= NOW() AND unpublish >= NOW())').order("news.id DESC") }
end
