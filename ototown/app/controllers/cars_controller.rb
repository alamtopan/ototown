class CarsController < ApplicationController
	def cars
		render layout: 'application_catalog'
	end
	def detail_car
		@car = Car.find(params[:id])
		render layout: 'application_car_detail'
	end
	def form_car
		render layout: 'application_home'
	end
end