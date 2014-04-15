class AddPictureInAdvertisement < ActiveRecord::Migration
  def self.up
    change_table :advertisements do |t|
      t.has_attached_file :picture
    end
  end

  def self.down
    drop_attached_file :advertisements, :picture
  end
end
