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

    def render(content)
      convert_emoji_to_html(ERB::Util.h(content))
    end
  end

  class MarkdownRenderer < Redcarpet::Render::HTML
    include EmojiConverter

    def paragraph(text)
      text = convert_emoji_to_html(text)
      text.gsub!("\n", "<br>\n")
      %Q{<p>#{text}</p>\n}
    end

    def list_item(text, list_type)
      text = convert_emoji_to_html(text)
      %Q{<li>#{text}</li>\n}
    end

    def table_cell(content, alignment)
      content = convert_emoji_to_html(content)
      %Q{<td align="#{alignment}">#{content}</td>}
    end
  end

  class Markdown
    def self.render(content)
      renderer = MarkdownRenderer.new(
        filter_html: true,
        safe_links_only: true,
        hard_wrap: true,
      )

      markdown = Redcarpet::Markdown.new(
        renderer,
        fenced_code_blocks: true,
        no_intra_emphasis:  true,
        tables:             true,
        autolink:           true
      )
      markdown.render(ERB::Util.h(content))
    end
  end
end
