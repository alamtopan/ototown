class WebSetting < ActiveRecord::Base
	attr_accessible :title, :description, :keywords, :header_tags, :footer_tags, :contact, :email, :logo, :pav_icon

	has_attached_file :logo, styles:  { 
                                     :medium => "600x600>", 
                                     :thumb => "100x100>" 
                                    }, 
                                    :default_url => "/assets/no-image.jpg"
  has_attached_file :pav_icon, styles:  { 
                                     :medium => "600x600>", 
                                     :thumb => "100x100>" 
                                    }, 
                                    :default_url => "/assets/no-image.jpg"
                                    
  validates_attachment :logo, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
  validates_attachment :pav_icon, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
end
