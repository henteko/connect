class User < ActiveRecord::Base

  has_many :blogs
  has_many :pages

  validates :email, presence: true

  devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  def url
    # TODO: Create user page
    # [Settings.connect.url, username].join('/')
    [Settings.connect.url, username, 'blog'].join('/')
  end

  def at_username
    "@#{username}"
  end

  def admin?
    role == 'admin'
  end
end
