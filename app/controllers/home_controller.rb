class HomeController < ApplicationController
  layout 'homepage'

  def index
    @recent_users = User.recent
    @recent_movies = Movie.recently_watched
  end
end
