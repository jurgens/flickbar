require 'spec_helper'

describe Authorization do
  it { should belong_to :user }
  it { should validate_presence_of :user_id }
end
