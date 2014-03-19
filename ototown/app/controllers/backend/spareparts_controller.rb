class Backend::SparepartsController < Backend::ApplicationController
  defaults :resource_class => Sparepart, :collection_name => 'spareparts', :instance_name => 'sparepart'

end