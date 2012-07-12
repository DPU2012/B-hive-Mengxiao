class AddDayToSignup < ActiveRecord::Migration
  def change
    add_column :signups, :Day, :string
  end
end
