require 'spec_helper'

describe Movie do

  it { should have_many :watches }
  it { should have_many(:users).through(:watches) }

  it { should validate_presence_of :title }

  pending "imdb_search"

end
