class Backend::ProductsController < Backend::ApplicationController
  defaults :resource_class => Product, :collection_name => 'products', :instance_name => 'product'
  helper_method :category_options 

  def category_options
    @news_category_options ||= Category.all.map{|category| [category.name, category.id] }
  end

end