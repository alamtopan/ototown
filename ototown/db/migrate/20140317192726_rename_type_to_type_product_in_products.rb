class RenameTypeToTypeProductInProducts < ActiveRecord::Migration
  def change
    rename_column :products, :type, :type_product
  end
end
