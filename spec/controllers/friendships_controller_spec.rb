require 'spec_helper'

describe FriendshipsController do
  before do
    @user = Factory :user
    @friend = Factory :user
    sign_in @user
  end

  describe "create" do
    before do
      post :create, :friend_id => @friend.id 
    end

    it { should respond_with :success }
  end
end
