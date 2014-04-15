class ImageProduct < ActiveRecord::Base
  attr_accessible :image, :name, :description, :product_id

  belongs_to :product

  has_attached_file :image, :styles => {
                                          :big => "1024x860>",
                                          :medium => "860x460>",
                                          :normal => "460x260>",
                                          :thumb => "125x125>"
                                        },
                                        :default_url => "/assets/no-image.jpg"

  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"],
                                               :size => { :in => 0..1024.kilobytes } }
end
