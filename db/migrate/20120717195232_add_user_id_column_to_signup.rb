class AddUserIdColumnToSignup < ActiveRecord::Migration
  def change
    add_column :signups, :User_Id, :integer
  end
end
