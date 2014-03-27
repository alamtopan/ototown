class CarsController < ApplicationController
  before_filter :generate_select, except: [:index,:show]
	def cars
		render layout: 'application_catalog'
	end

	def detail_car
		@car = Car.find(params[:id])
		render layout: 'application_car_detail'
	end

	def form_product
		@product = Product.new
		render layout: 'application_home'
	end

	def create_product
		@product = current_user.products.new(product_params)
		if @product.save
			flash[:notice] = 'Your Product Created'
		else
			flash[:alert] = 'Failed'
		end
		redirect_to user_home_path
	end

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

    def product_params
      params.require(:product).permit(:condition,:name,:category_id,:description,:province,:city,:brand,:model,:transmission,:year,:type_product,:color,
      																:price,:negotiable, images_attributes: [:image])
    end
end