class NotifyToServiceObserver < ActiveRecord::Observer

  observe :page, :blog, :comment

  def after_save(record)
    Services::Hipchat.notify(record) if ENV['HIPCHAT_NOTIFY_ACTIVE']
  end

end
