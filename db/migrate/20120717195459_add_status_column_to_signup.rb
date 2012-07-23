class AddStatusColumnToSignup < ActiveRecord::Migration
  def change
    add_column :signups, :status, :string
  end
end
