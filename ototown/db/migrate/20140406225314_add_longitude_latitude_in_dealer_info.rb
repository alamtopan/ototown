class AddLongitudeLatitudeInDealerInfo < ActiveRecord::Migration
  def change
  	add_column :dealer_infos, :longitude, :string
  	add_column :dealer_infos, :latitude, :string
  end
end
