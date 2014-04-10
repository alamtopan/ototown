class AddActiveInAdvertisement < ActiveRecord::Migration
  def change
  	add_column :advertisements, :active, :string
  end
end
