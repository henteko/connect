require 'spec_helper'

describe Document do
  it { should belong_to :user }
  it { should validate_presence_of :raw_title }
  it { should validate_presence_of :raw_body }
  it { should be_versioned }
end
