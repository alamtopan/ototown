class RenameBrandIdToBrandNameInModels < ActiveRecord::Migration
  def change
    rename_column :models, :brand_id, :brand_name
    change_column :models, :brand_name, :string
  end
end
