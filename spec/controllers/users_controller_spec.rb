require 'spec_helper'

describe UsersController do

  let(:user) { Factory(:user) }
  let(:friend) { Factory(:user) }
  let(:friendship) { Factory :friendship, :user => user, :friend => friend }

#  describe "get show" do
#    context "non-existing user" do
#      before  { get :show, :nickname => 'neverexisted' }
#      it      { should respond_with :not_found }
#    end
#
#    context "existing user" do
#      before  { get :show, :nickname => user.nickname }
#      it      { should render_template :show }
#      it      { should assign_to :owner }
#      it      { should assign_to :watches }
#    end
#  end

  describe "get show for a friend" do
    before    { friendship }
    before    { sign_in user }
    before    { get :show, :nickname => friend.nickname }
    it        { should respond_with :success }
    it        { should render_template :show }
    it        { should assign_to :friendship }
    it        { should assign_to :owner }
    it        { should assign_to :watches }
  end

#  describe "news" do
#    context "for non-authenticated user" do
#      before  { get :news }
#      it      { should redirect_to :new_user_session }
#    end
#
#    context "authenticated user" do
#      before  { sign_in user }
#      before  { get :news }
#      it      { should respond_with :success }
#      it      { should assign_to :news }
#    end
#  end

end
