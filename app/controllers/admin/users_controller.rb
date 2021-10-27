class Admin::UsersController < ApplicationController
  before_action :login_required
  before_action :require_admin

  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "「#{@user.name}」のユーザー情報を更新しました"
    else
      flash[:alert] = "「#{@user.name}」のユーザー情報の更新に失敗しました"
      render :edit
    end
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

  def user_params
    params.require(:user).permit(
      :admin,
      :active,
      :note,
    )
  end

end
