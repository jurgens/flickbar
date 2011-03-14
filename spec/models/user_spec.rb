require 'spec_helper'

describe User do
  it { should have_many :authorizations }
  it { should have_many :watches }
  it { should have_many :friendships }

#  describe "friend watches" do
#    before do
#      @me = Factory :user
#      @jack = Factory :user
#      @mary = Factory :user
#      @me.friends << @jack
#      @me.friends << @mary
#
#      @movie_1 = Factory(:movie)
#      @movie_2 = Factory(:movie)
#      @movie_3 = Factory(:movie)
#      @jack.movies << @movie_1
#      @jack.movies << @movie_2
#      @mary.movies << @movie_3
#    end
#
#    subject { @me.friend_watches }
#    it "should return friend watches" do
#      subject.should.include @movie_1
#      subject.should.include @movie_2
#      subject.should.include @movie_3
#    end
#  end
end
