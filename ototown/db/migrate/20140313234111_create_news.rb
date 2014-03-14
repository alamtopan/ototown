class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.datetime :published_at
      t.text :content
      t.string :source
      t.integer :category_id
      t.boolean :active

      t.timestamps
    end
  end
end
