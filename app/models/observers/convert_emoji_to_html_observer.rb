class ConvertEmojiToHtmlObserver < ActiveRecord::Observer

  observe :page, :blog

  def before_save(record)
    record.title = ::Parser::Emoji.new.render(record.title)
  end
end
