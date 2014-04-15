class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :footer_content
  before_filter :advertisements


  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password) }
  end

  def after_sign_in_path_for(resource)
    if current_user
      user_home_path
    elsif current_backend_admin
      backend_path
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    request.referrer
  end

  protected

    def footer_content
      @about = PageContent.where("category =?", "About Us")
      @need_help = PageContent.where("category =?", "Need Help")
      @slider = PageContent.where("category =?", "Slider")
      @web = WebSetting.first
    end

    def advertisements
      @advertisement_home_side_left = Advertisement.published.where("position =?","Home Side Left").first
      @advertisement_home_side_right = Advertisement.published.where("position =?","Home Side Right").first
      @advertisement_catalog_side_left = Advertisement.published.where("position =?","Catalog Side Left").first
      @advertisement_catalog_side_right = Advertisement.published.where("position =?","Catalog Side Right").first
      @advertisement_detail_car_side_left = Advertisement.published.where("position =?","Detail Car Side Left").first
      @advertisement_detail_car_side_right = Advertisement.published.where("position =?","Detail Car Side Right").first
      @advertisement_detail_news_side_left = Advertisement.published.where("position =?","Detail News Side Left").first
      @advertisement_detail_news_side_right = Advertisement.published.where("position =?","Detail News Side Right").first

      @advertisement_news_side_right_without_des = Advertisement.published.where("position =?","News Sidebar Right Without Information")
      @advertisement_news_side_right_with_des = Advertisement.published.where("position =?","News Sidebar Right With Information").first
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :username
    end

end
