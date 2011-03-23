class AddIndexForAuthorizationsUserId < ActiveRecord::Migration
  def self.up
    add_index :authorizations, :user_id
  end

  def self.down
    remove_index :authorizations, :user_id
  end
end
