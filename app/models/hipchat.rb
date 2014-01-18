class Hipchat < Notification
  def notify(object)
    message = "<a href='#{object.user.url}'>#{object.user.at_username}</a> "
    message += if object.class == Page
                 (object.versions.count == 1 ? 'created' : 'updated') + ' page'
               elsif object.class == Blog
                 (object.versions.count == 1 ? 'created' : 'updated') + ' entry'
               else
                 'commented'
               end
    message += " <a href='#{object.url}'>#{object.title}</a>"

    client = HipChat::Client.new(token)
    client[room_name].send('Connect', message, notify: false,
                           message_format: 'html')
  end
end
