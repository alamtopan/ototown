class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :full_name
      t.date :birthday
      t.string :address
      t.string :city
      t.string :codepos
      t.string :gender
      t.string :phone
      t.integer :user_id

      t.timestamps
    end
  end
end
