class PostsController < ApplicationController
  before_filter :load_and_authenticate_edit, only: [:edit, :update, :destroy]

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

  def edit
  end

  def update
    if @post.update_attributes(params[:post])
      flash[:success] = "Post edited!"
      redirect_to @post.topic
    else
      render :edit
    end
  end

  private

  def load_and_authenticate_edit
    @post = Post.find(params[:id])
    unless current_user.can_edit?(@post)
      flash[:error] = "Insufficient privileges"
      redirect_back_or @post.topic
    end
  end
end
