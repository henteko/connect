class Blog < Document
  has_many :comments

  def username
    @username ||= user.username
  end
end
