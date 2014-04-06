class DealersController < ApplicationController
  before_filter :generate_select

	def dealers
		@dealers_count = Dealer.includes(:dealer_info).where("dealer_infos.active = TRUE").order("operators.id DESC")
		@dealers = Dealer.includes(:dealer_info).where("dealer_infos.active = TRUE").page(params[:page]).per(8).order("operators.id DESC")
		render layout: 'application_catalog'
	end
	def detail_dealer
		@dealer = Dealer.find(params[:id])
		@cars_count = Car.where(user_id: @dealer.id)
		@cars = Car.where(user_id: @dealer.id).page(params[:page]).per(6).order("id DESC")
		render layout: 'application_dealer'
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
      catalog = ['Dealer', 'Workshop']
      @catalog = catalog.map{|cata| [cata, cata]}
    end

end