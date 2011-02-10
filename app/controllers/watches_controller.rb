class WatchesController < ApplicationController

#  before_filter :authenticate_user!

  def create

    @movie = Movie.find_or_create(params[:title])
    @watch = @movie.watches.build(:user_id => current_user.id)

    if @watch.save

      respond_to do |f|
        f.js
        f.html { redirect_to user_path(current_user.nickname) }
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

end
