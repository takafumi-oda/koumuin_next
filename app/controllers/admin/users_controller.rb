class Admin::UsersController < ApplicationController
  before_action :login_required
  before_action :require_admin

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: "ユーザー「#{@user.name}」を削除しました。"
  end

  private

  def require_admin
    redirect_to login_path unless current_user.admin?
  end
end
