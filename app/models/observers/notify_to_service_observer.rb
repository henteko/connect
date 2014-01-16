class NotifyToServiceObserver < ActiveRecord::Observer

  observe :page, :blog, :comment

  def after_save(record)
    Notification.notify(record)
  end
end
