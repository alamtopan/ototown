class PageContent < ActiveRecord::Base
	attr_accessible :title, :content, :category, :pic

	has_attached_file :pic, styles:  { 
                                     :medium => "600x600>", 
                                     :thumb => "100x100>" 
                                    }, 
                                    :default_url => "/assets/no-image.jpg"
                                    
  validates_attachment :pic, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
end
