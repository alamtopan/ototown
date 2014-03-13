class CreateImageProducts < ActiveRecord::Migration
  def change
    create_table :image_products do |t|
      t.string :name
      t.text :description
      t.integer :product_id
      t.attachment :image
      t.timestamps
    end
  end
end
