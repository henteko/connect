class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :manage,  :all if user.role == 'admin'
    can :edit,    Blog, user: user
    can :update,  Blog, user: user
    can :destroy, Blog, user: user
  end
end
