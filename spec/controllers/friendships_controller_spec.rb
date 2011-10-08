require 'spec_helper'

describe FriendshipsController do

  let(:user)        { Factory(:user) }
  let(:friend)      { Factory(:user) }
  let(:friendship)  { user.friendships.create(:friend_id => friend.id) }

  before { sign_in user }
  before { request.env["HTTP_REFERER"] = 'back' }

  describe "create" do
    before  { post :create, :friend_id => friend.id }
    it      { should respond_with :redirect }
    it      { should assign_to :friendship }
    specify { user.friends.should include friend }
  end

  describe "destroy" do
    before  { post :destroy, :id => friendship.id }
    it      { should respond_with :redirect }
    it      { should assign_to :friendship }
    specify { user.friends.should_not include friend }
  end

end
