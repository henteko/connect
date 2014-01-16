class AdminController < ApplicationController
  before_action :redirect_to_sign_in, unless: :user_signed_in?
  before_action :render_404, unless: -> { current_user.try(:admin?) }

  # GET /admin/role
  def role
  end
end
