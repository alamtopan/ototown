class SparepartsController < ApplicationController
	before_filter :generate_select, except: [:index,:show]

	def spareparts
		@spareparts = Sparepart.published.page(params[:page]).per(6).order("id DESC")
		render layout: 'application_catalog'
	end

	def detail_sparepart
		@sparepart = Sparepart.published.find_by(slug: params[:id])
		impressionist(@sparepart)
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
      @prices = [['< 100.000.000',0],['100.000.000-200.000.000','100000000-200000000'],['200.000.000-300.000.000','200000000-300000000'],['300.000.000-400.000.000','300000000-400000000'],['400.000.000-500.000.000','400000000-500000000'],
        ['500.000.000-600.000.000','500000000-600000000'],['600.000.000-700.000.000','600000000-700000000'],['700.000.000-800.000.000','700000000-800000000'],['800.000.000-900.000.000','800000000-900000000'],['900.000.000-1000.000.000','900000000-1000000000'],
        ['> 1000.000.000',10]]
    end

end