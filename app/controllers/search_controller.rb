class SearchController < ApplicationController
  def search
    if params[:keyword].blank?
      @search_posts = Post.all.includes([:user, :replies]).sort_by { |array| array.most_recent_update }.reverse
    else
      search_objects = []
      keywords = params[:keyword].split(/[[:blank:]]+/).select(&:present?)
      keywords.each do |keyword|
        posts = Post.search(keyword).includes([:user, :replies])
        replies = Reply.search(keyword)
        search_object = posts + Post.where(id: replies.select(:post_id).distinct).includes([:user, :replies])
        search_objects += search_object.uniq
      end
      if keywords.length == 1
        @search_posts = search_objects.sort_by { |array| array.most_recent_update }.reverse
      else
        @search_posts = search_objects.group_by{ |e| e }.select { |k, v| v.size > 1 }.map(&:first).sort_by { |array| array.most_recent_update }.reverse
      end
    end
  end
end
