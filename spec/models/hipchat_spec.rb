require 'spec_helper'

describe Hipchat do
  describe '#notify' do
    before { create(:notification) }
    it 'Send notification to HipChat' do
      HipChat::Room.any_instance.stub(:send).and_return(true)
      HipChat::Room.any_instance.should_receive(:send)
      create(:page)
    end
  end
end
