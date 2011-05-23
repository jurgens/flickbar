require 'spec_helper'

describe MoviesController do
  let(:user)      { Factory :user }
  let(:movie)     { Factory :movie }
  let(:watch)     { Factory :watch, :movie => movie, :user => user }

  describe "get show" do
    context "for a visitor" do
      before      { get :show, :id => movie.id }
      it          { should render_template :show }
      it          { should assign_to :movie }
    end

    context "for a logged user" do
      before      { sign_in user }
      before      { watch }
      before      { get :show, :id => movie.id }
      it          { should render_template :show }
      it          { should assign_to :movie }
      it          { assigns(:watch) == watch }
    end
  end

  describe "watch" do
    context "for visitor" do
      let(:user)  { Factory :user }
      before      { post :watch, :id => movie.id, :format => :js }
      it          { should respond_with :unauthorized }
    end

    context "for logged user" do
      let(:user)  { Factory :user }
      before      { sign_in user }

      context "not in wish list" do
        before      { post :watch, :id => movie.id, :format => :js }
        it          { should respond_with :success }
        it          { should assign_to :watch }
        specify     { response.content_type.should == 'text/javascript' }
      end

      context "in wish list" do
        before      { watch }
        before      { post :watch, :id => movie.id, :format => :js }
        it          { should respond_with :success }
        it          { should assign_to :watch }
        specify     { response.content_type.should == 'text/javascript' }
      end
    end
  end

  describe "wish" do
    let(:user)  { Factory :user }
    before      { sign_in user }

    context "not in wish list" do
      before      { post :watch, :id => movie.id, :format => :js }
      it          { should respond_with :success }
      it          { should assign_to :watch }
      specify     { response.content_type.should == 'text/javascript' }
    end
  end
end
