class Comment < ActiveRecord::Base
  has_paper_trail

  # Relations
  belongs_to :blog
  belongs_to :user

  # Validations
  validates :blog_id,  presence: true, numericality: true
  validates :user_id,  presence: true, numericality: true
  validates :raw_body, presence: true

  # Callbacks
  before_save do
    self.body = raw_body
  end

  # Instance methods
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
