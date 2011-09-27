class UsersController < ApplicationController

  before_filter :authenticate_user!, :only => [:news]
  before_filter :find_owner, :only => [:show]
  before_filter :set_order, :only => [:show]

  def show
    @watches = case params[:status]
      when nil
        @owner.watches.order('created_at DESC')
      when 'wish'
        @owner.wishlist
      when 'watched'
        @owner.watchedlist
    end
    @friendship = current_user.friendships.find_by_friend_id @owner.id unless current_user.blank?
  end

  def news
    @news = current_user.news(50)
  end

protected

  def set_order
    @order_by = params[:status] == 'watched' ? 'watched_at DESC' : 'created_at DESC'
  end

  def find_owner
    @owner = User.find_by_nickname(params[:nickname])
    render :text => '404: page not found', :status => 404 and return if @owner.blank?
  end
end
