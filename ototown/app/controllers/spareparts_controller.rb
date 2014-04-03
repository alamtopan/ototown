class SparepartsController < ApplicationController
	def spareparts
		@spareparts = Sparepart.page(params[:page]).per(6).order("id DESC")
		render layout: 'application_catalog'
	end

	def detail_sparepart
		@sparepart = Sparepart.find_by(slug: params[:id])
		impressionist(@sparepart)
		render layout: 'application_car_detail'
	end

end