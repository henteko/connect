module Markdown
  class Parser

    module WithPygments
      def add_code_tags(code, lang)
        code = code.sub(/<pre>/, "<pre><code class=\"#{lang} language-#{lang}\" data-lang=\"#{lang}\">")
        code = code.sub(/<\/pre>/,"</code></pre>")
      end

      def block_code(code, lang)
        lang = lang && lang.split.first || 'text'
        output = add_code_tags(
          Pygments.highlight(code, lexer: lang, options: { encoding: 'utf-8' }),
          lang
        )
      end
    end

    def self.convert(content)
      @renderer = Class.new(Redcarpet::Render::HTML) do
                    include WithPygments
                  end
      markdown = Redcarpet::Markdown.new(@renderer.new)
      markdown.render(content)
    end
  end
end
