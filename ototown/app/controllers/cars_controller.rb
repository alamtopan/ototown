class CarsController < ApplicationController
  before_filter :generate_select, except: [:index,:show]

	def cars
		condition = params[:condition]

		@cars = Car.published.where(condition: condition).page(params[:page]).per(6).order("id DESC")
		render layout: 'application_catalog'
	end

	def detail_car
		@car = Car.published.find_by(slug: params[:id])
		impressionist(@car)
		render layout: 'application_car_detail'
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

end