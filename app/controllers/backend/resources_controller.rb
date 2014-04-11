class Backend::ResourcesController < InheritedResources::Base
  layout 'application_backend'

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
end