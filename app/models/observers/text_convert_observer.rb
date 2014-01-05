class TextConvertObserver < ActiveRecord::Observer

  observe :wiki

  def before_save(record)
    record.body = Kramdown::Document.new(record.raw_body).to_html
  end

end
