class Notification < ActiveRecord::Base
  # Validations
  validates :room_name, presence: true
  validates :token,     presence: true
  validates :type,      presence: true

  # Class methods
  class << self
    def notify(object)
      self.all.each do |notification_service|
        notification_service.notify(object) if notification_service.active
      end
    end
  end
end
