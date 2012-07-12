class RemoveBirthdayFromSignup < ActiveRecord::Migration
  def up
    remove_column :signups, :Birthday
      end

  def down
    add_column :signups, :Birthday, :string
  end
end
