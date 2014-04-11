class AddSlidderImageToContents < ActiveRecord::Migration
  def self.up
    change_table :page_contents do |t|
      t.has_attached_file :pic
    end
  end

  def self.down
    drop_attached_file :page_contents, :pic
  end
end
