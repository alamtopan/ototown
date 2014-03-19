class PublicsController < ApplicationController
	def home
		@news_list = News.limit(10)
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
end