class Admin::UsersController < ApplicationController
  before_action :login_required
  before_action :require_admin

  def index
    @users = User.all.page(params[:page]).per(10)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if (@user.admin == true) || (@user.email == "guest@email.co.jp")
      flash[:alert] = "「#{@user.name}」のユーザー情報は変更することができません。"
      redirect_back(fallback_location: root_path)
    else
      if @user.update(user_params)
        redirect_to admin_users_path, notice: "「#{@user.name}」のユーザー情報を更新しました"
      else
        flash.now[:alert] = "「#{@user.name}」のユーザー情報の更新に失敗しました"
        render :edit
      end
    end
  end

  private

  def require_admin
    redirect_to login_path unless current_user.admin?
  end

  def user_params
    params.require(:user).permit(
      :admin,
      :active,
      :note,
    )
  end

end
