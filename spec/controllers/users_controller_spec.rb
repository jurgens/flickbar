require 'spec_helper'

describe UsersController do
  before do
    @user = Factory :user
  end

  describe "get show" do
    context "non-existing user" do
      before do
        get :show, :nickname => 'neverexisted'
      end

      it { should respond_with :not_found }
    end

    context "existing user" do
      before do
        get :show, :nickname => @user.nickname
      end

      it { should respond_with :success }
      it { should assign_to :owner }
      it { should assign_to :watches }
    end
  end

  describe "news" do
    context "for non-authenticated user" do
      before do
        get :news
      end

      it { should respond_with :redirect }
    end

    context "authenticated user" do
      before do
        sign_in @user
        get :news
      end

      it { should respond_with :success }
      it { should assign_to :news }
    end
  end
end
