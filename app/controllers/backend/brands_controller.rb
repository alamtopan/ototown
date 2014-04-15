class Backend::BrandsController < Backend::ApplicationController
  defaults :resource_class => Brand, :collection_name => 'brands', :instance_name => 'brand'
end