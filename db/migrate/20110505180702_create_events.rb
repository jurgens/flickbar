class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.belongs_to  :user
      t.belongs_to  :movie
      t.string      :kind
      t.timestamps
    end

    add_index :events, :user_id
    add_index :events, :movie_id
  end

  def self.down
    drop_table :events
  end
end
