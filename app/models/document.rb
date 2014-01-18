class Document < ActiveRecord::Base
  has_paper_trail

  # Relations
  belongs_to :user

  # Validations
  validates :raw_title, presence: true
  validates :raw_body,  presence: true
  validates :user_id,   presence: true, numericality: true
  validates :type,      presence: true

  # Callbacks
  before_save do
    self.title = raw_title
    self.body  = raw_body
  end
end
