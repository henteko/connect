class Document < ActiveRecord::Base

  belongs_to :user

  validates :raw_title, presence: true
  validates :raw_body,  presence: true

  has_paper_trail

  before_save do
    self.title = raw_title
    self.body  = raw_body
  end

end
