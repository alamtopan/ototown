class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :username
      t.string :email
      t.text :content
      t.integer :recipient_id
      t.boolean :read

      t.timestamps
    end
  end
end
