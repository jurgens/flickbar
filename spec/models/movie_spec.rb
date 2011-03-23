require 'spec_helper'

describe Movie do

  it { should have_many :watches }
  it { should have_many(:users).through(:watches) }

  it { should validate_presence_of :title }

  describe "find_or_create" do
    before do
      @title = 'The Godfather'
    end

    subject { Movie }

    it { subject.find_or_create(@title).should_not be_nil }
#    it "should find or create movie by title" do
#      Movie.find_or_create(title).should_not be_nil
#    end
  end
  
  pending "imdb_search" do

  end
  
end
