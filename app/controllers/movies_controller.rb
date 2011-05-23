class MoviesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  before_filter :resource

  def show
    @watch = current_user.watches.find_by_movie_id(@movie.id) if user_signed_in?
  end

  def wish
    @watch = current_user.watches.build :movie => @movie

    respond_to do |f|
      f.js { render :action => :watch }
    end
  end

  def watch
    @watch = current_user.watches.find_by_movie_id(@movie.id) || current_user.watches.build
    @watch.watch

    respond_to do |f|
      f.js
    end
  end

  def unwatch
    @watch = current_user.watches.find_by_movie_id(@movie.id) || current_user.watches.build
    @watch.wish

    respond_to do |f|
      f.js { render :action => :watch }
    end
  end

protected

  def resource
    @movie = Movie.find params[:id]
  end
end
