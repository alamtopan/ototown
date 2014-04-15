class AddDesInAdvertisement < ActiveRecord::Migration
  def change
  	add_column :advertisements, :content, :text
  end
end
