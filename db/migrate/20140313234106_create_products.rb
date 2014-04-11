class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :category_id
      t.string :condition
      t.string :type
      t.string :brand
      t.string :model
      t.string :year
      t.string :color
      t.string :plate_number
      t.date :exp_date
      t.integer :kilometer
      t.integer :door
      t.integer :seat
      t.string :transmission
      t.string :engine
      t.integer :cyclinders
      t.string :fuel
      t.string :location

      t.timestamps
    end
  end
end
