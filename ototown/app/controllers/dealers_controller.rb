class DealersController < ApplicationController
	def dealers
		render layout: 'application_catalog'
	end
	def detail_dealer
		render layout: 'application_dealer'
	end
end