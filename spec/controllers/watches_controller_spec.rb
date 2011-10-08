require 'spec_helper'

describe WatchesController do

  let(:user) { Factory(:user) }
  
  before { sign_in user }
  before { request.env["HTTP_REFERER"] = '/back' }

  describe "create" do
    before  { post :create, :title => 'Some movie title' }
    it      { assigns[:movie] }
    it      { assigns[:watch] }
    it      { should redirect_to user }
  end

end
