class AddPictureInNews < ActiveRecord::Migration
  def self.up
    change_table :news do |t|
      t.has_attached_file :pic
    end
  end

  def self.down
    drop_attached_file :news, :pic
  end
end
