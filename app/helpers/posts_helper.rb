module PostsHelper
  def datetime_format(datetime)
    datetime.strftime("%Y/%m/%d %-H:%M")
  end

  def post_delete_permission?
    @replies.empty? && (current_user.admin? || current_user == @post.user if current_user)
  end

  def reply_delete_permission?(reply)
    current_user.admin? || current_user == reply.user if current_user
  end
end
