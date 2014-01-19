require 'spec_helper'

describe ConvertEmojiToHtmlObserver do
  let (:observer) { ConvertEmojiToHtmlObserver.instance }

  TARGETS = [Page, Blog]

  TARGETS.each do |klass|
    it 'observes before_save events' do
      observer.should_receive(:before_save).once
      create(klass.to_s.underscore)
    end
  end

  describe '#before_save' do
    TARGETS.each do |klass|
      context "when #{klass}" do
        pending 'convert emoji' do
          object = create(klass.to_s.underscore)
          observer.should_receive(:convert_emoji_to_html).exactly(2).times
          observer.before_save(object)
        end
      end
    end
  end
end
