class AddStatusAndNegotiableToProducts < ActiveRecord::Migration
  def change
    add_column :products, :status, :boolean
    add_column :products, :negotiable, :boolean
  end
end
