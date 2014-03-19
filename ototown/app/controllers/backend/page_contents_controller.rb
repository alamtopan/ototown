class Backend::PageContentsController < Backend::ApplicationController
  defaults :resource_class => PageContent, :collection_name => 'page_contents', :instance_name => 'page_contents'
  before_filter :prepare_select

  def prepare_select
 		@category_contents = [
 														['Slider','Slider'],
 														['Widget Find Us','Widget Find Us'],
 														['About Us','About Us'],
 														['Need Help','Need Help']
 													]
 	end
end