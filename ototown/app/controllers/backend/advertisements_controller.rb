class Backend::AdvertisementsController < Backend::ApplicationController
	defaults :resource_class => Advertisement, :collection_name => "advertisements", :instance_name => "advertisement"
	before_filter :position

	private
		def position
			position = ['Home Side Left','Home Side Right','Catalog Side Left','Catalog Side Right','News Sidebar Right Without Information','News Sidebar Right With Information']
			@position = position.map{|po| [po, po]}
		end
end