class UsersController < ApplicationController
  before_action :login_required, only: %i[edit update show destroy posts]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "ユーザー「#{@user.name}」を登録しました"
    else
      flash[:alert] = "新しいアカウントの登録に失敗しました"
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      if current_user.admin
        redirect_to admin_users_path, notice: "「#{@user.name}」のユーザー情報を更新しました"
      else
        redirect_to user_path(@user.id), notice: "「#{@user.name}」のユーザー情報を更新しました"
      end
    else
      flash[:alert] = "「#{@user.name}」のユーザー情報の更新に失敗しました"
      render :edit
    end
  end

  def show
    @user = User.find(current_user.id)
  end

  def withdrawl
    @user = User.find(params[:id])
    @user.update(active: false)
    if current_user.admin
      redirect_to admin_users_path
    else
      reset_session
    end
  end

  def posts
    @posts = Kaminari.paginate_array(
      Post.where(user_id: current_user.id).includes([:user, :replies]).sort_by { |post| post.most_recent_update }.reverse
    ).page(params[:page]).per(10)
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation,
      :age,
      :organization,
      :job,
      :status,
      :introduction,
      :admin,
      :note
    )
  end
end
