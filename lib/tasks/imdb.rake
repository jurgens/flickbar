require File.expand_path(File.dirname(__FILE__) + "/../../config/environment")

namespace :imdb do
  namespace :search do
    desc "Search for movie details on IMDB"
    task(:movies) do
      Movie.where("imdb_not_found = 0").where("imdb_id IS NULL").map(&:imdb_search)
    end
  end
end