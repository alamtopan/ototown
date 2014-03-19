class DealerInfo < ActiveRecord::Base
  attr_accessible :address, :dealer_id, :active, :title, :description, :phone, :email
  belongs_to :dealer
end
