class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :manage,  :all if user.role == 'admin'
    can [:edit, :update, :destroy], Blog, user: user
  end
end
