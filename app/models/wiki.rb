class Wiki < ActiveRecord::Base

  validates :title,    presence: true
  validates :raw_body, presence: true

  before_save do
    self.body = raw_body
  end

end
