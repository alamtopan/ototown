class DealerInfo < ActiveRecord::Base
  attr_accessible :address, :dealer_id, :active
  belongs_to :dealer
end
