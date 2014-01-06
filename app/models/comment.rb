class Comment < ActiveRecord::Base

  belongs_to :blog

  validates :raw_body,  presence: true

  has_paper_trail

  before_save do
    self.body  = raw_body
  end

end
