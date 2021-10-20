class SearchController < ApplicationController
  def search
    if params[:keyword].blank?
      @search_posts = Post.all.includes([:user, :replies])
    else
      search_objects = []
      keywords = params[:keyword].split(/[[:blank:]]+/).select(&:present?)
      keywords.each do |keyword|
        posts = Post.search(keyword).includes([:user, :replies])
        replies = Reply.search(keyword)
        search_object = posts + Post.where(id: replies.select(:post_id).distinct).includes([:user, :replies])
        search_objects += search_object
      end
      @search_posts = search_objects.uniq.sort_by { |array| array.most_recent_update }.reverse
    end
  end
end
