class WatchesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :load_user
  before_filter :load_watch, :only => [:destroy, :watched, :wish]

  def create
    unless params[:movie_id].blank?
      @movie = Movie.find params[:movie_id]
    else
      @movie = Movie.find_or_create_by_title(params[:title])
    end

    @watch = @movie.watches.build :user_id => @user.id

    success = @watch.save

    respond_to do |format|
      format.html {
        flash[:notice] = success ? "Successfully added \"#{@watch.movie_title}\" to your list" : 'Error: ' + @watch.errors.full_messages.join(' ')
        redirect_to user_path(@user.nickname)
      }
      format.js {
        render :action => :failure unless success
      }
    end
  end

  def copy
    @watch = Watch.find params[:id]
    @new_watch = @user.watches.build :movie_id => @watch.movie_id
    if @new_watch.save
      respond_to do |format|
        flash[:notice] = 'Successfully added a movie to your list'
        format.js { render :action => :create }
      end
    end
  end

  def destroy
    if @watch.destroy
      flash[:notice] = 'Successfully removed movie from your watch list'
      redirect_to :back
    end
  end

  def watched
    @watch.watch

    respond_to do |format|
      format.js
    end
  end

  def wish
    @watch.update_attribute :watched, false

    respond_to do |format|
      format.js { render :action => :watched }
    end
  end

protected

  def load_watch
    @watch = @user.watches.find(params[:id])
  end

  def load_user
    @user = current_user
  end

end
