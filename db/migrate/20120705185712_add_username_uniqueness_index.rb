class AddUsernameUniquenessIndex < ActiveRecord::Migration
  def self.up
  	add_index :signins, :username, :unique => true
  end

  def self.down
  	remove.index :signins, :username
  end
end
