require 'spec_helper'

describe Blog do
  it { should have_many :comments}
end
