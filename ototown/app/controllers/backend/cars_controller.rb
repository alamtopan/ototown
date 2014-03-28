class Backend::CarsController < Backend::ApplicationController
  defaults :resource_class => Car, :collection_name => 'cars', :instance_name => 'car'
  prepend_before_filter :generate_select, except: [:index,:show]
  before_filter :choice_condition

  private
    def generate_select
      @models = Model.all.map{|m| [m.name, m.name]}
      @types = Type.all.map{|t| [t.name, t.name]}
      @brands = Brand.all.map{|t| [t.name, t.name]}
      @years = (1945..Time.new.year).to_a.map{|y| [y, y]}
      colors = ['Black','Red','White','Blue','Silver','Pink','Gray','Metalic','Silver Stone','Green',
        'Yellow','Purple','Maroon']
      @colors = colors.map{|c| [c,c]}
      @transmissions = ['Auto','Mechanic'].map{|tr| [tr,tr]}
    end

    def choice_condition
      @condition = [
                      "All",
                      "Used",
                      "New",
                      "Classic"
                    ]
    end
end