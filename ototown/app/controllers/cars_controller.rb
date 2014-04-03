class CarsController < ApplicationController
  before_filter :generate_select, except: [:index,:show]

	def cars
		condition = params[:condition]

		@cars = Car.published.where(condition: condition).page(params[:page]).per(6).order("id DESC")
		render layout: 'application_catalog'
	end

	def detail_car
		@car = Car.published.find_by(params[:id])
		impressionist(@car)
		render layout: 'application_car_detail'
	end

end