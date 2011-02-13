class AddImdbNoFoundToMovies < ActiveRecord::Migration
  def self.up
    add_column :movies, :imdb_not_found, :boolean, :default => false
  end

  def self.down
    remove_column :movies, :imdb_not_found
  end
end
