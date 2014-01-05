class ConvertEmojiObserver < ActiveRecord::Observer

  observe :wiki

  def before_save(record)
    record.body = record.body.gsub(/:([a-z0-9\+\-_]+):/) do |match|
      if Emoji.names.include?($1)
        '<img alt="' + $1 + '" height="20" src="' + "/images/emoji/#{$1}.png" + '" style="vertical-align:middle" width="20" />'
      else
        match
      end
    end
  end

end
