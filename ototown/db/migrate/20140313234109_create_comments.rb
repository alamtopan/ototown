class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :username
      t.string :email
      t.text :content
      t.integer :advertise_id

      t.timestamps
    end
  end
end
