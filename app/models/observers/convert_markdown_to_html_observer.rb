class ConvertMarkdownToHtmlObserver < ActiveRecord::Observer

  observe :page, :blog, :comment

  def before_save(record)
    record.body = ::Parser::Markdown.render(record.body)
  end
end
