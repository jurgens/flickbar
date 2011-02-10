class HomeController < ApplicationController
  def index
    @recent_users = User.recent
    @recent_movies = Movie.recently_watched
  end
end
