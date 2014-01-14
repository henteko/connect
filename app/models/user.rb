class User < ActiveRecord::Base

  has_many :blogs
  has_many :pages

  validates :email, presence: true

  devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    role == 'admin'
  end
end
