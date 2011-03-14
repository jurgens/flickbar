require 'spec_helper'

describe WatchesController do

  before do
    @user = Factory :user
    sign_in(@user)
  end

  describe "create" do
    before do
      request.env["HTTP_REFERER"] = '/back'
      post :create, :title => 'Some movie title'
    end

    it { assigns[:movie] }
    it { assigns[:watch] }
    it { should respond_with :redirect }
  end
end
