class CreateFriendships < ActiveRecord::Migration
  def self.up
    create_table :friendships do |t|
      t.integer     :user_id,   :null => false
      t.integer     :friend_id, :null => false
      t.timestamps
    end

    add_index :friendships, :user_id
    add_index :friendships, :friend_id
  end

  def self.down
    drop_table :friendships
  end
end
