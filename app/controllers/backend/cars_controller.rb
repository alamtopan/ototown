class Backend::CarsController < Backend::ApplicationController
  defaults :resource_class => Car, :collection_name => 'cars', :instance_name => 'car'
  prepend_before_filter :generate_select, except: [:index,:show]
  prepend_before_filter :set_car, except: [:new, :create, :index]
  prepend_before_filter :set_advertise, only: [:new, :create]
  before_filter :choice_condition
  before_filter :choice_status

  private
    def generate_select
      @users = User.all.map{|u| [u.email, u.id]}
      @models = Model.all.map{|m| [m.name, m.name]}
      @types = Type.all.map{|t| [t.name, t.name]}
      @brands = Brand.all.map{|t| [t.name, t.name]}
      @years = (1945..Time.new.year).to_a.map{|y| [y, y]}
      colors = ['Black','Red','White','Blue','Silver','Pink','Gray','Metalic','Silver Stone','Green',
        'Yellow','Purple','Maroon']
      @colors = colors.map{|c| [c,c]}
      @transmissions = ['Auto','Mechanic'].map{|tr| [tr,tr]}
    end

    def set_car
      @car = Car.find_by(slug: params[:id])
      @advertise = @car.advertise
    end

    def set_advertise
      @advertise = Advertise.new(car: Car.new)
    end

    def choice_condition
      @condition = [
                      "Used",
                      "New",
                      "Classic"
                    ]
    end

    def choice_status
      @choice_status = [ "true", "false"]
    end

    def product_params
      params.require(:car).permit(:condition,:name,:category_id,:description,:province,:city,:brand,:model, :fuel, :status,
                        :transmission,:year,:type_product,:color, :price,:negotiable, :location, :cylinders,
                        images_attributes: [:id,:image,:_destroy],
                        advertise_attributes: [:price, :loan_term, :interest_rate, :down_payment, :active, :product_id])
    end
end