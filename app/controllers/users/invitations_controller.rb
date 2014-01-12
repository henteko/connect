class Users::InvitationsController < Devise::InvitationsController
  before_action :render_404, only: [:new, :create], unless: -> { current_user.admin? }
  before_action :add_breadcrumb_to_invitation_path, only: [:new]

  private

  def after_invite_path_for(resource)
    new_user_invitation_path
  end

  def add_breadcrumb_to_invitation_path
    add_breadcrumb 'Send invitation', new_user_invitation_path
  end
end
