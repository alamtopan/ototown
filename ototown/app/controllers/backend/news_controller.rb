class Backend::NewsController < Backend::ApplicationController
  defaults :resource_class => News, :collection_name => 'news', :instance_name => 'news'
  helper_method :news_category_options 

  def news_category_options
    @news_category_options ||= CategoryNews.all.map{|category| [category.title, category.id] }
  end
end