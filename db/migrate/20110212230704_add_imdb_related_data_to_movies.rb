class AddImdbRelatedDataToMovies < ActiveRecord::Migration
  def self.up
    add_column :movies, :imdb_id, :string
    add_column :movies, :director, :string
    add_column :movies, :poster_file_name, :string
    add_column :movies, :rating, :decimal, :precision => 3, :scale => 1
    add_column :movies, :release_date, :date

  end

  def self.down
    remove_column :movies, :imdb_id
    remove_column :movies, :director
    remove_column :movies, :poster_file_name
    remove_column :movies, :rating
    remove_column :movies, :release_date
  end
end
