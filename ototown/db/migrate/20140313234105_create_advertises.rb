class CreateAdvertises < ActiveRecord::Migration
  def change
    create_table :advertises do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.decimal :price
      t.integer :product_id
      t.integer :loan_term
      t.integer :interest_rate
      t.decimal :down_payment
      t.string :category
      t.date :start_at
      t.date :end_at
      t.boolean :active

      t.timestamps
    end
  end
end
