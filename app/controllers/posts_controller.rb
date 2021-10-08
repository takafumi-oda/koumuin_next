class PostsController < ApplicationController
  before_action :login_required, only: %i[new create destroy]

  def index
    @posts = Post.all.includes([:user])
  end

  def new
    @user = User.find(current_user.id)
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to post_path(@post.id), notice: "新しい投稿をしました"
    else
      flash[:alert] = "新しい投稿に失敗しました"
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
    redirect_to new_post_path, notice: "投稿を削除しました"
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
