class PostsController < ApplicationController
  before_action :login_required, only: %i[new create destroy]

  def index
    @posts = Post.all.includes([:user, :replies]).sort_by { |post| post.most_recent_update }.reverse
  end

  def new
    @user = User.find(current_user.id)
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to post_path(@post.id), notice: "新しい相談をしました"
    else
      flash[:alert] = "新しい相談の登録に失敗しました"
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @replies = @post.replies.includes([:user, :likes])
    @reply = Reply.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path, notice: "相談を削除しました"
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
