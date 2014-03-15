class Backend::NewsController < Backend::ApplicationController
  defaults :resource_class => News, :collection_name => 'news', :instance_name => 'news'
end