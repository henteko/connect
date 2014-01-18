class Settings < Settingslogic
  source "#{Rails.root}/config/connect.yml"
  namespace Rails.env

  class << self
    def connect_on_non_standard_port?
      ![443, 80].include?(connect.port.to_i)
    end

    private

    def build_connect_url
      if connect_on_non_standard_port?
        custom_port = ":#{connect.port}"
      else
        custom_port = nil
      end
      [ connect.protocol,
        "://",
        connect.host,
        custom_port,
        connect.relative_url_root
      ].join('')
    end
  end
end


#
# Connect
#
Settings['connect'] ||= Settingslogic.new({})
Settings.connect['host']       ||= 'localhost'
Settings.connect['https']        = false if Settings.connect['https'].nil?
Settings.connect['port']       ||= Settings.connect.https ? 443 : 80
Settings.connect['relative_url_root'] ||= ENV['RAILS_RELATIVE_URL_ROOT'] || ''
Settings.connect['protocol']   ||= Settings.connect.https ? "https" : "http"
Settings.connect['url']        ||= Settings.send(:build_connect_url)
