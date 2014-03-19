class ImageProduct < ActiveRecord::Base
  attr_accessible :image, :name, :description

  belongs_to :product

  has_attached_file :image, :styles => { 
                                          :big => "1024x860>", 
                                          :medium => "860x460>", 
                                          :normal => "460x260>", 
                                          :thumb => "125x125>" 
                                        }
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
end
