require 'spec_helper'

describe Comment do
  it { should belong_to(:blog) }
  it { should belong_to(:user) }
  it { should validate_presence_of :raw_body }
  it { should be_versioned }
end
