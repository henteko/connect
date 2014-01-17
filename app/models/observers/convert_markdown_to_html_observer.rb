class ConvertMarkdownToHtmlObserver < ActiveRecord::Observer

  observe :page, :blog, :comment

  def before_save(record)
    record.body = ::Markdown::Parser.convert(record.body)
  end

end
