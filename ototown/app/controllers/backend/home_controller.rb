class Backend::HomeController < Backend::ApplicationController
  def index
  	@users = Operator.all.size-1
  	@dealers = Dealer.all.size
  	@cars = Car.all.size
  	@spare_parts = Sparepart.all.size
  end
end