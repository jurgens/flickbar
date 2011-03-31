require 'spec_helper'

describe User do
  
  it { should have_many :authorizations }
  it { should have_many :watches }
  it { should have_many :friendships }
  it { should have_many(:movies).through(:watches) }
  it { should have_many(:friends).through(:friendships) }

  describe "friends_with?" do
    let(:batman) { Factory(:user) }
    let(:robin)  { Factory(:user) }
    let(:joker)  { Factory(:user) }
    
    before  { batman.friends << robin }
    specify { batman.should     be_friends_with robin }
    specify { batman.should_not be_friends_with joker }
  end

  describe "remember_me (for Devise to always remember the user)" do
    specify { User.new.remember_me.should be_true }
  end

  pending "news"

end
