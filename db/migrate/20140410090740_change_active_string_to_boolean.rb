class ChangeActiveStringToBoolean < ActiveRecord::Migration
  def up
   change_column :advertisements, :active, :boolean
  end

  def down
   change_column :advertisements, :active, :string
  end
end
