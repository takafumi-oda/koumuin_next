class PasswordController < ApplicationController
  before_action :login_required, only: %i[edit update]

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(password_params) && @user.valid?(:password_update)
      flash[:notice] = "パスワードを変更しました"
      redirect_to user_path(current_user.id)
    else
      flash[:alert] = "パスワードの変更に失敗しました"
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
