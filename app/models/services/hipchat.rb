module Services
  class Hipchat < ActiveRecord::Base

    class << self
      def notify(object)
        message = object.new_record? ? 'Created ' : 'Updated '
        message << object.class.to_s.downcase
        room_name = ENV['HIPCHAT_OPTION_ROOM_NAME']
        notify    = ENV['HIPCHAT_OPTION_NOTIFY']
        client = HipChat::Client.new(ENV['HIPCHAT_API_TOKEN'])
        client[room_name].send('Connect', message, notify: notify)
      end
    end

  end
end
