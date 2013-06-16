class VotesController < ApplicationController
  def create
    opts = {post_id: params[:post_id], user_id: current_user.id}
    vote = Vote.find(:first, conditions: opts) || Vote.new(opts)

    if vote.value == 1
      flash[:error] = "Already voted this post" unless request.xhr?
    elsif (vote.value = 1) && vote.save
      flash[:success] = "Upvoted!" unless request.xhr?
    else
      flash[:error] = vote.errors.full_messages.join("<br>") unless request.xhr?
    end

    if request.xhr?
      render json: {points: vote.post.points, id: vote.post.id}
    else
      redirect_to Post.find(params[:post_id]).topic
    end
  end

  def destroy
    opts = {post_id: params[:post_id], user_id: current_user.id}
    vote = Vote.find(:first, conditions: opts) || Vote.new(opts)
    if vote.value == -1
      flash[:error] = "Already downvoted this post" unless request.xhr?
    elsif (vote.value = -1) && vote.save
      flash[:notice] = "Downvoted!" unless request.xhr?
    else
      flash[:error] = vote.errors.full_messages.join("<br>") unless request.xhr?
    end

    if request.xhr?
      render json: {points: vote.post.points, id: vote.post.id}
    else
      redirect_to Post.find(params[:post_id]).topic
    end
  end
end
