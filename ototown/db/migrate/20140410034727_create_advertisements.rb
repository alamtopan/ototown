class CreateAdvertisements < ActiveRecord::Migration
  def change
    create_table :advertisements do |t|
      t.string :title
      t.date :publish
      t.date :unpublish
      t.string :position
      t.string :name
      t.string :phone
      t.text :address
      t.integer :price

      t.timestamps
    end
  end
end
