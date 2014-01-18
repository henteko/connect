class Comment < ActiveRecord::Base

  belongs_to :blog
  belongs_to :user

  validates :raw_body,  presence: true

  has_paper_trail

  before_save do
    self.body = raw_body
  end

  def title
    @title ||= blog.title
  end

  def username
    @username ||= user.username
  end

  def url
    [Settings.connect.url, username, blog_id].join('/') + "#commet-id-#{id}"
  end
end
