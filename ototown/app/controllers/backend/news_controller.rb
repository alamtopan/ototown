class Backend::NewsController < Backend::ResourcesController
  defaults :resource_class => News, :collection_name => 'news', :instance_name => 'news'
end