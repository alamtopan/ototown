class AddProvinceAndCityToProducts < ActiveRecord::Migration
  def change
    add_column :products, :city, :string
    add_column :products, :province, :string
  end
end
