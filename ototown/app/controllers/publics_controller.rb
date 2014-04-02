class PublicsController < ApplicationController
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

	def brand_model
    render inline: "<%= select_tag :team_id, options_for_select(Model.where(brand_name: params[:brand]).map{|brand| [brand.name, brand.id] }), { prompt: 'Please Select',class: 'form-control', id: 'model_product' } %>"
	end
end