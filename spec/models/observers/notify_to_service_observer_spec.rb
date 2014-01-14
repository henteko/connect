require 'spec_helper'

describe NotifyToServiceObserver do
  let (:observer) { NotifyToServiceObserver.instance }

  TARGETS = [Page, Blog, Comment]

  TARGETS.each do |klass|
    it 'observes before_save events' do
      if klass == Comment
        observer.should_receive(:after_save).exactly(2).times
      else
        observer.should_receive(:after_save).once
      end
      create(klass.to_s.underscore)
    end
  end
end
