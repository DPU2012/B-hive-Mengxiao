class AddRoleColumnToSignup < ActiveRecord::Migration
  def change
    add_column :signups, :role, :string
  end
end
