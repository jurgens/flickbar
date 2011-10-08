class FriendshipsController < ApplicationController

  def create
    @friend = User.find params[:friend_id]
    @friendship = current_user.friendships.build :friend_id => @friend.id

    if @friendship.save
      flash[:notice] = "You have added #{@friend.nickname} to your friends."
    else
      flash[:error] = "Error adding a friend"
    end

    redirect_to :back
  end

  def destroy
    @friendship = current_user.friendships.find params[:id]

    if @friendship.destroy
      flash[:notice] = 'Friendship never ends'
    else
      flash[:error] = 'Error'
    end

    redirect_to :back
  end
end
