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
      flash.now[:alert] = "新しいアカウントの登録に失敗しました"
      render :new
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
        if current_user.admin
          redirect_to admin_users_path, notice: "ユーザー情報を変更しました"
        else
          redirect_to user_path(@user.id), notice: "ユーザー情報を変更しました"
        end
      else
        flash.now[:alert] = "ユーザー情報の変更に失敗しました"
        render :edit
      end
    end
  end

  def show
    @user = User.find(current_user.id)
  end

  def withdrawl
    @user = User.find(params[:id])
    if (@user.admin == true) || (@user.email == "guest@email.co.jp")
      flash[:alert] = "「#{@user.name}」は退会することができません。"
      redirect_to admin_users_path
    else
      @user.update(active: false)
      if current_user.admin
        redirect_to admin_users_path
      else
        reset_session
      end
    end
  end

  def posts
    @posts = Kaminari.paginate_array(
      Post.where(user_id: current_user.id).includes([:user, :replies]).sort_by { |post| post.most_recent_update }.reverse
    ).page(params[:page]).per(10)
    respond_to do |format|
      format.html
      format.js
    end
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
      :active,
      :admin,
      :note
    )
  end
end
