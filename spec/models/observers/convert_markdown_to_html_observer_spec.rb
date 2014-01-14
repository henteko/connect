require 'spec_helper'

describe ConvertMarkdownToHtmlObserver do
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
        it 'convert markdown to html' do
          object = create(klass.to_s.underscore)
          Kramdown::Document.any_instance.should_not_receive :new
          observer.before_save(object)
        end
      end
    end
  end
end
