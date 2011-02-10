class CreateWatches < ActiveRecord::Migration
  def self.up
    create_table :watches do |t|
      t.belongs_to :user
      t.belongs_to :movie
      t.timestamps
    end

    add_index :watches, :user_id
    add_index :watches, :movie_id
  end

  def self.down
    drop_table :watches
  end
end
