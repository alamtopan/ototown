class AddLinkInAdvertisement < ActiveRecord::Migration
  def change
  	add_column :advertisements, :link_url, :string
  end
end
