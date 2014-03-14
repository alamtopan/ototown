class CarsController < ApplicationController
	def cars
	end
	def detail_car
		render layout: 'application_car_detail'
	end
	def form_car
		render layout: 'application_home'
	end
end