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
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @reply = Reply.find(params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def reply_params
    params.require(:reply).permit(:content, :post_id, :parent_id)
  end
end
