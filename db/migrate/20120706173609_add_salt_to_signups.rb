class AddSaltToSignups < ActiveRecord::Migration
  def change
    add_column :signups, :salt, :string
  end
end
