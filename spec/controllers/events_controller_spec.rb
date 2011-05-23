require 'spec_helper'

describe EventsController do
  let(:batman)      { Factory :user }
  let(:robin)       { Factory :user }
  let(:friendship)  { Factory :friendship, :user => batman, :friend => robin }
  let(:watch)       { Factory :watch, :user => robin }

  describe "index" do
    before  { friendship; watch }
    before  { sign_in batman }
    before  { get :index }
    it      { should respond_with :success }
    it      { should assign_to :events }
  end
end
