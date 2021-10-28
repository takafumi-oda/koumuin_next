class SearchController < ApplicationController
  def search
    if params[:keyword].blank?
      @search_posts = Kaminari.paginate_array(
        Post.all.includes([:user, :replies]).sort_by { |array| array.most_recent_update }.reverse
      ).page(params[:page]).per(10)
      respond_to do |format|
        format.html
        format.js
      end
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
        @search_posts = Kaminari.paginate_array(
          search_objects.sort_by { |array| array.most_recent_update }.reverse
        ).page(params[:page]).per(10)
        respond_to do |format|
          format.html
          format.js
        end
      else
        @search_posts = Kaminari.paginate_array(
          search_objects.group_by { |e| e }.reject { |key, value| value.size < keywords.length }.map(&:first).sort_by { |array| array.most_recent_update }.reverse
        ).page(params[:page]).per(10)
        respond_to do |format|
          format.html
          format.js
        end
      end
    end
  end
end
