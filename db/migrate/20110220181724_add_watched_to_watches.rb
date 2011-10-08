class AddWatchedToWatches < ActiveRecord::Migration
  def self.up
    add_column :watches, :watched, :boolean, :default => false
  end

  def self.down
    remove_column :watches, :watched
  end
end
