class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    cannot :destroy, Page
    can [:edit, :update, :destroy], Blog, user: user
    can :manage,  :all if user.role == 'admin'
  end
end
