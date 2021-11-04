class RepliesController < ApplicationController
  before_action :login_required

  def create
    @reply = Reply.create(reply_params)
    @reply.user = current_user
    if @reply.save
      unless @reply.parent_id
        flash[:notice] = "この相談に回答しました"
      else
        flash[:notice] = "この回答に返信しました"
      end
      redirect_back(fallback_location: root_path)
    else
      unless @reply.parent_id
        flash[:alert] = "この相談への回答が登録できませんでした"
      else
        flash[:alert] = "この回答への返信が登録できませんでした"
      end
      @post = Post.find(@reply.post_id)
      @replies = @post.replies.includes([:user, :likes])
      render template: "posts/show"
    end
  end

  def destroy
    @replies = Reply.where(parent_id: params[:id]).destroy_all
    @reply = Reply.find(params[:id])
    unless @reply.parent_id
      flash[:notice] = "回答を削除しました"
    else
      flash[:notice] = "返信を削除しました"
    end
    @reply.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def reply_params
    params.require(:reply).permit(:content, :post_id, :parent_id)
  end
end
