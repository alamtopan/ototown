class AddRoleIdAndUsernameToOperators < ActiveRecord::Migration
  def change
    add_column :operators, :role_id, :integer
    add_column :operators, :username, :string
    add_index  :operators, :role_id
  end
end
