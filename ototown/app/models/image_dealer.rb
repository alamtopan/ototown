class ImageDealer < ActiveRecord::Base
  attr_accessible :image, :title, :description

  belongs_to :dealer
  belongs_to :user, foreign_key: 'dealer_id'

  has_attached_file :image, :styles => { 
                                          :big => "1024x860>", 
                                          :medium => "860x460>", 
                                          :normal => "460x260>", 
                                          :thumb => "125x125>" 
                                        }, 
                                        :default_url => "/assets/no-image.jpg"

  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }

end
