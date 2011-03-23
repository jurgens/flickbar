require 'spec_helper'

describe FriendshipsController do
  before do
    @user = Factory :user
    @friend = Factory :user
    sign_in @user
  end

  describe "create" do
    before do
      request.env["HTTP_REFERER"] = 'back'
      post :create, :friend_id => @friend.id 
    end

    it { should respond_with :redirect }
    it { should assign_to :friendship }
  end

  describe "destroy" do
    before do
      @friendship = @user.friendships.create(:friend_id => @friend.id)
      request.env["HTTP_REFERER"] = 'back'
      post :destroy, :id => @friendship.id
    end

    it { should respond_with :redirect }
    it { should assign_to :friendship }
  end

end
