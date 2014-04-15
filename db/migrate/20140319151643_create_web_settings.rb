class CreateWebSettings < ActiveRecord::Migration
  def change
    create_table :web_settings do |t|
      t.string :title
      t.text :description
      t.text :keywords
      t.text :header_tags
      t.text :footer_tags
      t.string :contact
      t.string :email

      t.timestamps
    end
  end
end
