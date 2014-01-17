require 'spec_helper'

describe ConvertEmojiObserver do
  let (:observer) { ConvertEmojiObserver.instance }

  TARGETS = [Page, Blog, Comment]

  TARGETS.each do |klass|
    it 'observes before_save events' do
      if klass == Comment
        observer.should_receive(:before_save).exactly(2).times
      else
        observer.should_receive(:before_save).once
      end
      create(klass.to_s.underscore)
    end
  end

  describe '#before_save' do
    TARGETS.each do |klass|
      context "when #{klass}" do
        pending 'convert emoji' do
          object = create(klass.to_s.underscore)
          if klass == Comment
            observer.should_receive(:convert_emoji_to_html).once
          else
            observer.should_receive(:convert_emoji_to_html).exactly(2).times
          end
          observer.before_save(object)
        end
      end
    end
  end
end
