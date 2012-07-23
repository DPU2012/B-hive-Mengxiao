class RemoveRetypeEmailFromSignup < ActiveRecord::Migration
  def up
    remove_column :signups, :retype_email
      end

  def down
    add_column :signups, :retype_email, :string
  end
end
