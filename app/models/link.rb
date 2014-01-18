class Link < ActiveRecord::Base
  # Validations
  validates :title, presence: true
  validates :url,   presence: true
end
