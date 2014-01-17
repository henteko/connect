class Admin::NotificationsController < ApplicationController
  before_action :redirect_to_sign_in, unless: :user_signed_in?
  before_action :render_404, unless: -> { current_user.try(:admin?) }
  before_action :set_notification

  # GET /admin/notification
  def show
    add_breadcrumb t('.setting_notification'), admin_notification_path
  end

  # PUT /admin/notification
  def update
    respond_to do |format|
      if @notification.update(notification_params)
        format.html { redirect_to admin_notification_path,
                      notice: t('.notification_was_successfully_updated') }
        format.json { head :no_content }
      else
        format.html { render action: 'show' }
        format.json { render json:   @notification.errors,
                             status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_notification
    service = params[:service] || 'hipchat'
    @notification = Notification.find_by_type(service.classify) || service.classify.constantize.new
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def notification_params
    params.require(:hipchat).permit(:room_name, :token, :active)
  end
end
