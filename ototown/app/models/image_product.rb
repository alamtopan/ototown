class ImageProduct < ActiveRecord::Base
  belongs_to :product

  has_attached_file :image, :styles => { 
                                          :big => "1024x860>", 
                                          :medium => "860x460>", 
                                          :normal => "460x260>", 
                                          :thumb => "125x125>" 
                                        }
end
