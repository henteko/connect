class AdminController < ApplicationController
  before_action :render_404, unless: -> { current_user.admin? }

  # GET /admin
  def index
  end

  # GET /admin/notification
  def notification
  end

  # GET /admin/role
  def role
  end

end
