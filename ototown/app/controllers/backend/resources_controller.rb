class Backend::ResourcesController < InheritedResources::Base
  
  def create  
    create! do |success, failure|
      success.html { redirect_to collection_path }
    end
  end  

  def update  
    update! do |success, failure|
      success.html { redirect_to collection_path }
    end
  end  

  protected
    def per_page
      params[:per_page] ||= 25
    end

    def page
      params[:page] ||= 1
    end

    def collection
      get_collection_ivar || set_collection_ivar(end_of_association_chain.page(page).per(per_page))
    end
end