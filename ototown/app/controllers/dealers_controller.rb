class DealersController < ApplicationController
	def dealers
		@dealers_count = Dealer.includes(:dealer_info).where("dealer_infos.active = TRUE").order("operators.id DESC")
		@dealers = Dealer.includes(:dealer_info).where("dealer_infos.active = TRUE").page(params[:page]).per(8).order("operators.id DESC")
		render layout: 'application_catalog'
	end
	def detail_dealer
		@dealer = Dealer.find(params[:id])
		@cars_count = Car.where(user_id: @dealer.id)
		@cars = Car.where(user_id: @dealer.id).page(params[:page]).per(8).order("id DESC")
		render layout: 'application_dealer'
	end
end