class AddPublishUnpublishToNews < ActiveRecord::Migration
  def change
  	add_column :news, :publish, :date
  	add_column :news, :unpublish, :date
  end
end
