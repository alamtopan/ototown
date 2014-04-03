class Advertise < ActiveRecord::Base
  attr_accessible :price, :loan_term, :interest_rate, :down_payment, :active, :product_id
  belongs_to :product
  belongs_to :user
  has_many   :comments
  validates_length_of :loan_term, :maximum => 3
  validates_length_of :interest_rate, :maximum => 2
end
