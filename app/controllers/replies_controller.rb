class RepliesController < ApplicationController
  before_action :login_required

  def create
    @reply = Reply.create(reply_params)
    @reply.user = current_user
    if @reply.save
      redirect_back(fallback_location: root_path)
    else
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
