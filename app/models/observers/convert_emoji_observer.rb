class ConvertEmojiObserver < ActiveRecord::Observer

  observe :page

  def before_save(record)
    record.title = convert_emoji_to_html(record.title)
    record.body = convert_emoji_to_html(record.body)
  end

  private

  def convert_emoji_to_html(text)
    text.gsub(/:([a-z0-9\+\-_]+):/) do |match|
      if Emoji.names.include?($1)
        '<img alt="' + $1 + '" height="20" src="' + "/images/emoji/#{$1}.png" + '" style="vertical-align:middle" width="20" />'
      else
        match
      end
    end
  end

end
