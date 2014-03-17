class Backend::CarsController < Backend::ApplicationController
  defaults :resource_class => Car, :collection_name => 'cars', :instance_name => 'car'

end