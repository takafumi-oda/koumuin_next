module PostsHelper
  def datetime_format(datetime)
    datetime.strftime("%Y年%m月%d日%-H時%M分")
  end
end
