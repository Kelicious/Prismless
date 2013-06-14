class PostsController < ApplicationController
  def create
    post = current_user.posts.new(params[:post])
    post.topic_id = params[:topic_id] if params[:topic_id]

    authenticate_privacy(post)

    if post.save
      redirect_to post.topic
    else
      flash[:error] = post.errors.full_messages.join("\n")
      redirect_to post.topic
    end
  end
end
