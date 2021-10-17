class SearchController < ApplicationController
  def search
    @search_posts = Post.all.includes([:user, :replies]) if params[:keyword].blank?
    keywords = params[:keyword].split(/[[:blank:]]+/).select(&:present?)
    keywords.each do |keyword|
      @posts = Post.search(keyword).includes([:user, :replies])
      @replies = Reply.search(keyword)
      search_object = @posts + Post.where(id: @replies.select(:post_id).distinct).includes([:user, :replies])
      @search_posts = search_object.uniq.sort_by { |post| post.most_recent_update }.reverse
    end
  end
end
