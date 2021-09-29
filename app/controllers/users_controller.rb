class UsersController < ApplicationController
  before_action :set_relation_tables, only: %i[new create edit update]
  before_action :login_required, only: %i[edit update show destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "ユーザー「#{@user.name}」のアカウントを登録しました"
    else
      flash[:alert] = "新しいアカウントの登録に失敗しました"
      render :new
    end
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "「#{@user.name}」のユーザー情報を更新しました"
    else
      flash[:alert] = "「#{@user.name}」のユーザー情報の更新に失敗しました"
      render :edit
    end
  end

  def show
    @user = User.find(current_user.id)
  end

  def destroy
    @user = User.find(current_user.id)
    @user.destroy
    redirect_to new_user_path, notice: "ユーザー「#{@user.name}」を削除しました"
  end

  private

  def set_relation_tables
    @ages = Age.all
    @organizations = Organization.all
    @jobs = Job.all
    @statuses = Status.all
  end

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation,
      :age_id,
      :organization_id,
      :job_id,
      :status_id,
      :introduction
    )
  end
end
