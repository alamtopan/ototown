class CreateDealerInfos < ActiveRecord::Migration
  def change
    create_table :dealer_infos do |t|
      t.text :address
      t.text :no_dealer
      t.integer :dealer_id
      t.boolean :active

      t.timestamps
    end
  end
end
