require 'spec_helper'

describe MoviesController do

  let(:movie) { Factory(:movie) }

  describe "get show" do
    before { get :show, :id => movie.id }
    it     { should render_template :show }
    it     { should assign_to :movie }
  end

end
