class AddMonthToSignup < ActiveRecord::Migration
  def change
    add_column :signups, :Month, :string
  end
end
