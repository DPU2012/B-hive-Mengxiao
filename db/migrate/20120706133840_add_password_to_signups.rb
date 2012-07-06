class AddPasswordToSignups < ActiveRecord::Migration
  def change
    add_column :signups, :encrypted_password, :string
  end
end
