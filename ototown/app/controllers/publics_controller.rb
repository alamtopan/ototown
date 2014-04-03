class PublicsController < ApplicationController
	before_action :generate_select, only: [:home,:search]

	def home
		@news_list = News.limit(1)
		@cars = Car.limit(10).order('created_at DESC')
		render layout: 'application_home'
	end

	def news
		@news = News.published.page(params[:page]).per(8).order("id DESC")
		render layout: 'application_news'
	end

	def detail_news
		@news = News.where(id: params[:id]).first
		@news_list = News.limit(10)
		render layout: 'application_news_detail'
	end

	def page
		@page = PageContent.where(id: params[:id]).first
		render layout: 'application_page_detail'
	end

	def brand_model
    render inline: "<%= select_tag :team_id, options_for_select(Model.where(brand_name: params[:brand]).map{|brand| [brand.name, brand.id] }), { prompt: 'Please Select',class: 'form-control', id: 'model_product' } %>"
	end

	def search
		@products = Product.published.filter_search(params[:search]).page(params[:page])
		render layout: 'application_catalog'
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