class LikesController < ApplicationController
  def create
    like = current_user.likes.create!(like_params)
    render json: like
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
    render json: like
  end

  private

  def like_params
    params.require(:like).permit(:reply_id)
  end
end
