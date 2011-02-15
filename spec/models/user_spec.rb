require 'spec_helper'

describe User do
  it { should have_many :authorizations }
  it { should have_many :watches }
  it { should have_many :friendships }
end
