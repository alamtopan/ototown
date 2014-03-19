class UpdateFieldsInDealerInfos < ActiveRecord::Migration
  def change
    add_column :dealer_infos, :title, :string
    add_column :dealer_infos, :description, :text
    add_column :dealer_infos, :phone, :string
    add_column :dealer_infos, :email, :string
    remove_column :dealer_infos, :no_dealer
  end
end
