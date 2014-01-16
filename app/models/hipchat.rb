class Hipchat < Notification
  def notify(object)
    message = object.versions.count == 1 ? 'Created ' : 'Updated '
    message << object.class.to_s.downcase

    # TODO: Add link to object page url
    # message << " <a href='#{object.url}'>#{object.title}</a>"

    client = HipChat::Client.new(token)
    client[room_name].send('Connect', message, notify: false,
                           message_format: 'html')
  end
end
