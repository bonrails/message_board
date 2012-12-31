module PostsHelper
  def decorate_message_tag(post)
    "Posted on " + post.created_at.to_time.strftime('%B, %e %Y @  %l:%M %p') + " By #{post.user.name}"
  end
end
