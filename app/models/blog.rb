class Blog < Document
  # Relations
  has_many :comments

  # Instance methods
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
