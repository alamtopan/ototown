class Backend::SparepartsController < Backend::ApplicationController
  defaults :resource_class => Sparepart, :collection_name => 'spareparts', :instance_name => 'sparepart'
  prepend_before_filter :generate_select, except: [:index,:show]

  private
    def generate_select
      @models = Model.all.map{|m| [m.name, m.name]}
      @types = Type.all.map{|t| [t.name, t.name]}
      @brands = Brand.all.map{|t| [t.name, t.name]}
      @years = (1945..Time.new.year).to_a.map{|y| [y, y]}
    end
end