class DealerInfo < ActiveRecord::Base
  attr_accessible :address, :dealer_id, :active, :title, :description, :phone, :email, :category_type, :longitude, :latitude
  belongs_to :dealer
end
