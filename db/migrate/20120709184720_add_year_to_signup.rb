class AddYearToSignup < ActiveRecord::Migration
  def change
    add_column :signups, :Year, :string
  end
end
