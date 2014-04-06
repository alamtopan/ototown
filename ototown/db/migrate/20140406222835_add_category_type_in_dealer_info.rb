class AddCategoryTypeInDealerInfo < ActiveRecord::Migration
  def change
  	add_column :dealer_infos, :category_type, :string
  end
end
