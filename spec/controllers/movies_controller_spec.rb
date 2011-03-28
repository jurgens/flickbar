require 'spec_helper'

describe MoviesController do

#  describe "get index" do
#    before do
#      get :index
#    end
#
#    it { should respond_with :success }
#  end

  describe "get show" do
    before do
      @movie = Factory :movie
      get :show, :id => @movie.id
    end

    it { should respond_with :success }
  end

end
