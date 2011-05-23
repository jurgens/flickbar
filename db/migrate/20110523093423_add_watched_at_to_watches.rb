class AddWatchedAtToWatches < ActiveRecord::Migration
  def self.up
    add_column :watches, :watched_at, :datetime
    Watch.update_all "watched_at = created_at", "status = 'watched'"
  end

  def self.down
    remove_column :watches, :watched_at
  end
end
