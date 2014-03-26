class Backend::ModelsController < Backend::ApplicationController
  defaults :resource_class => Model, :collection_name => 'models', :instance_name => 'model'
  prepend_before_filter :generate_select, except: [:index,:show]

  private
    def generate_select
      @brands = Brand.all.map{|t| [t.name, t.name]}
    end
end