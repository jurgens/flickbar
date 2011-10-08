class ReplaceWatchedWithStatusInWatches < ActiveRecord::Migration
  def self.up
    add_column :watches, :status, :string, :limit => 20
    Watch.update_all "status = 'wish'", "watched = 0"
    Watch.update_all "status = 'watched'", "watched = 1"
    remove_column :watches, :watched

    add_index :watches, :status
  end

  def self.down
    add_column :watches, :watched, :boolean
    Watch.update_all "watched = 0", "status = 'wish'"
    Watch.update_all "watched = 1", "status = 'watched'"
    remove_column :watches, :status
  end
end
