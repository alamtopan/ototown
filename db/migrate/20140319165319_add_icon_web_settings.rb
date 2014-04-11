class AddIconWebSettings < ActiveRecord::Migration
  def self.up
    change_table :web_settings do |t|
      t.has_attached_file :pav_icon
      t.has_attached_file :logo
    end
  end

  def self.down
    drop_attached_file :web_settings, :pav_icon
    drop_attached_file :web_settings, :logo
  end
end
