require 'spec_helper'

describe Event do
  it { should belong_to :user }
  it { should belong_to :movie }

  let(:a_watch) { Factory :watch }

  describe "event creation" do
    specify     { expect { a_watch }.to change(Event, :count).by(1) }
  end

#  describe "watched" do
#    before      { watch }
#    specify     { expect { puts "status" + watch.status; watch.watch }.to change(Event, :count).by(1) }
#  end

  describe "changing status to 'watched' should create new event" do
    before      { a_watch }
    before      { a_watch.watch }
    subject     { Event.very_last }
    its(:movie) { should == a_watch.movie }
    its(:user)  { should == a_watch.user }
    its(:kind)  { should == 'watch' }
  end

end