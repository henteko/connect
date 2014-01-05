class Wiki < ActiveRecord::Base

  validates :title,    presence: true
  validates :raw_body, presence: true

end
