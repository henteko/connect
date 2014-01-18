class Blog < Document
  has_many :comments

  def username
    @username ||= user.username
  end

  def url
    [Settings.connect.url, username, id].join('/')
  end

  def url_to_history
    [Settings.connect.url, username, id, 'history'].join('/')
  end
end
