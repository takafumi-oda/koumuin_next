class RepliesController < ApplicationController
  def create
    @reply = Reply.create(reply_params)
  end

  def destroy
  end

  private

  def reply_params
    params.require(:reply).permit(:content)
  end
end
