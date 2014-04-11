class Advertisement < ActiveRecord::Base
	attr_accessible :title, :publish, :unpublish, :position, :name, :phone, :address, :price, :picture, :active, :content

	has_attached_file :picture, styles:  { 
                                     :medium => "600x600>", 
                                     :thumb => "100x100>" 
                                    }, 
                                    :default_url => "/assets/no-image.jpg"
  
  validates_attachment :picture, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
 	scope :published,  -> { where('(publish IS NULL OR unpublish IS NULL) OR (publish <= NOW() AND unpublish >= NOW())').where('active = true') }
end
