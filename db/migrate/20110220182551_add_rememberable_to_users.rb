class AddRememberableToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :remember_token, :string
    add_column :users, :remember_created_at, :datetime
  end

  def self.down
    remove_column :users, :remember_token
    remove_column :users, :remember_created_at
  end
end
