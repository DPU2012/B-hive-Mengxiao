class AddRememberTokenToSignup < ActiveRecord::Migration
  def change
    add_column :signups, :remember_token, :string
    add_index  :users, :remember_token
  end
end
