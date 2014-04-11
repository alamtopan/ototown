class CreateImageDealers < ActiveRecord::Migration
  def change
    create_table :image_dealers do |t|
      t.string :title
      t.attachment :image
      t.text :description
      t.integer :dealer_id

      t.timestamps
    end
  end
end
