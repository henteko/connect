class Page < Document
  def url
    [Settings.connect.url, 'pages', page_name].join('/')
  end

  def url_to_history
    [Settings.connect.url, 'pages', page_name, 'history'].join('/')
  end
end
