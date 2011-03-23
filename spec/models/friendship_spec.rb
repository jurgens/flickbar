require 'spec_helper'

describe Friendship do
  it { should belong_to :user }
  it { should belong_to :friend }
end
