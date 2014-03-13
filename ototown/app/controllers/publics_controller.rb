class PublicsController < ApplicationController
	def home
		render layout: 'application_home'
	end
	def news
		render layout: 'application_news'
	end
	def detail_news
		render layout: 'application_news_detail'
	end
	def dealers
	end
	def cars
	end
	def detail_car
		render layout: 'application_car_detail'
	end
	def user_home
		render layout: 'application_user'
	end
	def user_profile
		render layout: 'application_user'
	end
	def form_car
		render layout: 'application_home'
	end
end