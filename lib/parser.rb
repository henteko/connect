module Parser
  module EmojiConverter
    def convert_emoji_to_html(text)
      text = String.new(text)
      text.gsub(/:([a-z0-9\+\-_]+):/) do |match|
        if ::Emoji.names.include?($1)
          '<img alt="' + $1 + '" height="20" src="' + "/images/emoji/#{$1}.png" + '" style="vertical-align:middle" width="20" />'
        else
          match
        end
      end
    end
  end

  class Emoji
    include EmojiConverter
    include ERB::Util

    def render(content)
      convert_emoji_to_html(h(content))
    end
  end

  class MarkdownRenderer < Redcarpet::Render::HTML
    include EmojiConverter

    def paragraph(text)
      text = convert_emoji_to_html(text)
      text.gsub!("\n", "<br>\n")
      %Q{<p>#{text}</p>\n}
    end
  end

  class Markdown
    def self.render(content)
      renderer = MarkdownRenderer.new(
        hard_wrap: true,
        filter_html: true
      )
      markdown = Redcarpet::Markdown.new(
        renderer,
        fenced_code_blocks: true,
        autolink:           true
      )
      markdown.render(content)
    end
  end
end
