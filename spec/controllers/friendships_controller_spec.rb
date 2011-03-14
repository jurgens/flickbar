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
  end
end
