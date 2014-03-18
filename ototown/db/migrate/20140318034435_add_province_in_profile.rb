class AddProvinceInProfile < ActiveRecord::Migration
  def change
  	add_column :profiles, :province, :string
  end
end
