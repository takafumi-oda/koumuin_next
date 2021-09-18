module PostsHelper
  def datetime_format(datetime)
    datetime.strftime("%Y年%m月%d日%-H時%M分")
  end

  def post_delete_permission?
    @replies.empty? && (current_user.admin? || current_user == @post.user if current_user)
  end

  def reply_delete_permission?(reply)
    current_user.admin? || current_user == reply.user if current_user
  end
end
