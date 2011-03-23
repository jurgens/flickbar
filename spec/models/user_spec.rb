require 'spec_helper'

describe User do
  it { should have_many :authorizations }
  it { should have_many :watches }
  it { should have_many :friendships }
  it { should have_many(:movies).through(:watches) }
  it { should have_many(:friends).through(:friendships) }

  describe "in_friendship_with" do
    before do
      @batman = Factory :user
      @robin = Factory :user
      @joker = Factory :user

      @batman.friends << @robin
      @robin.friends << @batman
    end

    it { @batman.in_friendship_with(@robin).should be_true }
    it { @robin.in_friendship_with(@batman).should be_true }
    it { @batman.in_friendship_with(@joker).should be_false }

  end

  describe "remember me" do
    before { @user = Factory :user }
    subject { @user.remember_me }
    it { should be_true }
  end

  pending "news" do
    
  end
end
