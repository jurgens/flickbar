require 'spec_helper'

describe Watch do
  context "watched while ago" do
    before do
      @user = Factory :user
      @movie = Factory :movie
      Timecop.travel(10.days.ago) do
        @watch = Factory :watch, :movie => @movie, :user => @user
      end
    end

    it "should allow to create new watch" do
      @watch_again = Factory.build :watch, :movie => @movie, :user => @user
      @watch_again.should have(0).errors
    end
  end

  context "recently watched" do
    before do
      @movie = Factory :movie
      @watch = Factory :watch, :movie => @movie, :user => @user
    end

    it "should not allow to create new watch" do
      Rails.logger.debug "watches count = #{Watch.count}"
      @watch_again = Factory.build :watch, :movie => @movie, :user => @user
      @watch_again.should have(1).error_on(:base)
    end
  end
end
