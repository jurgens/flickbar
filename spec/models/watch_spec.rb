require 'spec_helper'

describe Watch do

  let(:user)      { Factory(:user) }
  let(:movie)     { Factory(:movie) }
  let(:watch)     { Factory(:watch, :movie => movie, :user => user) }
  let(:new_watch) { Factory.build(:watch, :movie => movie, :user => user) }

  it { should belong_to :user }
  it { should belong_to :movie }

  it { should validate_presence_of :user_id }
  it { should validate_presence_of :movie_id }

  describe "watching a movie before long time ago" do
    before do
      Timecop.travel(10.days.ago) { Factory(:watch, :movie => movie, :user => user) }
    end

    specify { new_watch.should be_valid }
  end

  describe "watching the same movie close to the recent" do
    before  { watch }
    specify { new_watch.should_not be_valid }
    specify { new_watch.should have(1).error_on(:base) }
  end
end
