class AddColumnsToOperators < ActiveRecord::Migration
  def change
    add_column :operators, :provider, :string
    add_column :operators, :uid, :string
  end
end
