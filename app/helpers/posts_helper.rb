module PostsHelper
  def points_with_color(post)
    klass = case
            when post.points > 0
              "up"
            when post.points < 0
              "down"
            else
              "neutral"
            end
    "<span class='points #{klass}'>#{post.points}</span>"
  end
end
