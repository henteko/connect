class ConvertMarkdownToHtmlObserver < ActiveRecord::Observer

  observe :page, :blog, :comment

  def before_save(record)
    record.body = Kramdown::Document.new(record.body).to_html
  end

end
