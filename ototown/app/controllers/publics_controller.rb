class PublicsController < ApplicationController
	before_action :generate_select, only: [:home,:search]

	def home
		@news_list = News.limit(1)
		@cars = Car.published.limit(20).order('created_at DESC')
		@dealers = Dealer.includes(:dealer_info).where("dealer_infos.active = TRUE").order("dealer_infos.id DESC").limit(3)
		@spareparts = Sparepart.limit(20).order('created_at DESC')
		render layout: 'application_home'
	end

	def news
		@news = News.includes(:category_news).where("category_news.title = 'News'").published.page(params[:page]).per(4)
		render layout: 'application_news'
	end

	def tips
		@news = News.includes(:category_news).where("category_news.title = 'Tips'").published.page(params[:page]).per(4)
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
    search_params=params[:search]
    price_tab = search_params[:price].split('-')
    if price_tab.size < 2
      if search_params[:price].split('<').size > 1
        search_params[:price_to] = search_params[:price].split('<')[1].strip
      elsif search_params[:price].split('<').size > 1
        search_params[:price_to] = search_params[:price].split('>')[1].strip
      end
    else
      search_params[:price_to] = price_tab[1]
      search_params[:price_from] = price_tab[0]
    end
		@products = Product.published.filter_search(search_params).page(params[:page])
    unless @products.present?
      flash[:alert] = "Search Data Not Found"
      if request.env["HTTP_REFERER"].present?
        redirect_to :back
      else
        redirect_to root_path
      end
    else
      render layout: 'application_catalog'
    end
	end

  def compare
    unless cookies[:compare_products].nil?
      unless cookies[:compare_products].include?(params[:id])
        cookies[:compare_products] = cookies[:compare_products].split() << params[:id]
      end
    else
      cookies[:compare_products] = params[:id]
    end
    flash[:notice] = "Product Has add to Compare"
    redirect_to compare_products_path
  end

  def compare_products
    slugs = cookies[:compare_products] ? cookies[:compare_products].split('&') : []
    @products = Car.published.where("slug IN (?)", slugs)
    render layout: 'application_catalog'
  end

  def delete_compare
    cookies.delete :compare_products
    flash[:notice] = "Compared Product Has already to delete"
    redirect_to root_path
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
      @prices = [['< 100.000.000','< 100000000'],['100.000.000-200.000.000','100000000-200000000'],['200.000.000-300.000.000','200000000-300000000'],['300.000.000-400.000.000','300000000-400000000'],['400.000.000-500.000.000','400000000-500000000'],
        ['500.000.000-600.000.000','500000000-600000000'],['600.000.000-700.000.000','600000000-700000000'],['700.000.000-800.000.000','700000000-800000000'],['800.000.000-900.000.000','800000000-900000000'],['900.000.000-1000.000.000','900000000-1000000000'],
        ['> 1000.000.000','> 1000000000']]
    end
end