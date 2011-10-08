class MovieTitleUpcase < ActiveRecord::Migration
  def self.up
    Movie.all.each do |movie|
      movie.update_attribute :title, movie.title.titleize
    end
  end

  def self.down
    #How to write down migration for this case?
    Movie.all.each do |movie|
      movie.update_attribute :title, movie.title.downcase
    end
    #This is not exactly the same
  end
end

