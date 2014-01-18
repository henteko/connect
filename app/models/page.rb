class Page < Document
  # Validations
  validates :page_name, presence: true, uniqueness: true,
                        format: { with: /\A[\w\-]+\z/ }

  # Instance methods
  def url
    [Settings.connect.url, 'pages', page_name].join('/')
  end

  def url_to_history
    [Settings.connect.url, 'pages', page_name, 'history'].join('/')
  end
end
