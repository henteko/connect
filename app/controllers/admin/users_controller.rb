class Admin::UsersController < ApplicationController
  before_action :redirect_to_sign_in, unless: :user_signed_in?
  before_action :render_404, unless: -> { current_user.try(:admin?) }
  before_action :set_user, except: [:index]

  # GET /admin/users
  def index
    @users = User.page(params[:page])
    add_breadcrumb 'users', admin_users_path
  end

  # GET /admin/users/1/edit
  def edit
    add_breadcrumb 'users', admin_users_path
    add_breadcrumb @user.username, edit_admin_user_path(@user)
  end

  # PATCH/PUT /admin/users/1
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to edit_admin_user_path(@user), notice: 'User was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: @user }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/users/1
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :role)
    end
end
