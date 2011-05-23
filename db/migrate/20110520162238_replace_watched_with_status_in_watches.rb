class ReplaceWatchedWithStatusInWatches < ActiveRecord::Migration
  def self.up
    add_column :watches, :status, :string, :limit => 20
    Watch.all.each do |watch|
      watch.status = watch.watched? ? 'watched' : 'wish'
    end
    remove_column :watches, :watched

    add_index :watches, :status
  end

  def self.down
    add_column :watches, :watched, :boolean
    Watch.all.each do |watch|
      watch.watched = watch.status == 'watched'
    end
    remove_column :watches, :status
  end
end
