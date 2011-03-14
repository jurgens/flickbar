class WatchesController < ApplicationController

  before_filter :authenticate_user!

  def create
    unless params[:movie_id].blank?
      @movie = Movie.find params[:movie_id]
    else
      @movie = Movie.find_or_create params[:title]
    end

    @watch = @movie.watches.build :user_id => current_user.id

    logger.debug @watch.inspect

    if @watch.save
      respond_to do |f|
        f.html {
          flash[:notice] = "Successfully added \"#{@watch.movie.title}\" to your list" 
          redirect_to user_path(current_user.nickname)
        }
        f.js {

        }
      end
    else
      respond_to do |f|
        f.html {
          flash[:error] = 'Error: ' + @watch.errors.full_messages.join(' ')
          redirect_to user_path(current_user.nickname)
        }
        f.js {
          render :action => :failure
        }
      end
    end
  end

  def destroy
    watch = current_user.watches.find(params[:id])

    if watch.destroy
      flash[:notice] = 'Successfully removed movie from your watch list'
      redirect_to :back
    end
  end

  def watched
    @watch = current_user.watches.find(params[:id])
    @watch.update_attribute :watched, true

    respond_to do |format|
      format.js
    end
  end

  def wish
    @watch = current_user.watches.find(params[:id])
    @watch.update_attribute :watched, false

    respond_to do |format|
      format.js { render :action => :watched }
    end
  end

end
