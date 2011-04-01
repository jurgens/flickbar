class UsersController < ApplicationController

  before_filter :authenticate_user!, :only => [:news]
  before_filter :find_owner, :only => [:show]

  def show
    @watches = @owner.watches
    @friendship = current_user.friendships.find_by_friend_id @owner.id
  end

  def news
    @news = current_user.news(50)
  end

protected

  def find_owner
    @owner = User.find_by_nickname(params[:nickname])
    render :text => '404: page not found', :status => 404 and return if @owner.blank?
  end
end
