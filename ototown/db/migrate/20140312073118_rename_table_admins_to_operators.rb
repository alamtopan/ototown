class RenameTableAdminsToOperators < ActiveRecord::Migration
  def change
    rename_table :admins, :operators
  end
end
