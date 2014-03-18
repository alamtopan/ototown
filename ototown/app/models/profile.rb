class Profile < ActiveRecord::Base
	attr_accessible :full_name, :birthday, :address, :city, :codepos, :gender, :phone, :user_id, :avatar

  belongs_to :user, foreign_key: 'user_id'
  belongs_to :dealer, foreign_key: 'user_id'
  has_attached_file :avatar, styles:  { 
                                     :medium => "600x600>", 
                                     :thumb => "100x100>" 
                                    }, 
                                    :default_url => "/assets/no-image.jpg"
                                    
  validates_attachment :avatar, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }

end