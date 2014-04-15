class Backend::CategoryNewsController < Backend::ApplicationController
  defaults :resource_class => CategoryNews, :collection_name => 'category_news', :instance_name => 'category_news'
end