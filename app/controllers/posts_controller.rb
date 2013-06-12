class PostsController < ApplicationController
  def create
    post = current_user.posts.new(params[:post])
    post.topic_id = params[:topic_id] if params[:topic_id]
    if post.save
      render json: post.to_json(include: :author)
    else
      render json: post.errors, status: 422
    end
  end
end
