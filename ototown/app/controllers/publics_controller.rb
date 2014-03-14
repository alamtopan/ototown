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
end