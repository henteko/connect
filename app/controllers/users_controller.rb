class UsersController < ApplicationController
  before_action :redirect_to_sign_in, unless: :user_signed_in?

  # GET /user/edit
  def edit
  end

  # PUT /user
  def update
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to edit_user_path,
                      notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: current_user.errors,
                             status: :unprocessable_entity }
      end
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :username)
  end
end
