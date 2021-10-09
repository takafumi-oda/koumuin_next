class SearchController < ApplicationController
  def search
    @posts = Post.search(params[:keyword]).includes([:user])
    @replies = Reply.search(params[:keyword])
    search_object = @posts + Post.where(id: @replies.select(:post_id).distinct)
    @search_posts = search_object.uniq
  end
end
