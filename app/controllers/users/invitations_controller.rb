class Users::InvitationsController < Devise::InvitationsController
  before_action :render_404, only: [:new, :create], unless: -> { current_user.admin? }

  private

  def after_invite_path_for(resource)
    new_user_invitation_path
  end
end
