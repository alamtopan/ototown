class Backend::AdvertisesController < Backend::ApplicationController
  defaults :resource_class => Advertise, :collection_name => 'advertises', :instance_name => 'advertise'
  prepend_before_filter :generate_select, except: [:index,:show]

  def generate_select
  	@products = Product.all.map{|adv| [adv.name, adv.id]}
  end
end